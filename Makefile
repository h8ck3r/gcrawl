DOCKER_GOOS ?= $(GOOS)
DOCKER_GOARCH ?= $(GOARCH)
DOCKER_GO111MODULE := on
DOCKER_GOBIN := /go/bin
DOCKER_GOPATH := /go
DOCKER_GOROOT := /usr/local/go

DOCKERGOCOMMAND=@docker run --gpus all -v $$PWD:/go/src/github.com/h8ck3r/gcrawl -w /go/src/github.com/h8ck3r/gcrawl -e GO111MODULE=$(GO111MODULE) -e GOOS=$(GOOS) -e GOARCH=$(GOARCH) --rm -it golang:1.13.6-alpine3.11 go

PREFIX = $(CURDIR)
BIN = $(PREFIX)/bin
CONFDIR = $(PREFIX)/etc/gcrawl
LIBDIR = $(PREFIX)/lib/gcrawl

OUT = gcrawl
SRC = main.go

all: build

$(BIN):
	@mkdir -p "$@"

$(BIN)/%:

$(CONFDIR):
	@mkdir -p "$@"

$(CONFDIR)/%:
	touch $(CONFDIR)/test.txt

config: $(CONFDIR)/gcrawl

build:
	$(DOCKERGOCOMMAND) build -x -v -o gcrawl main.go

test:
	@docker run -v $$PWD:/go/src/github.com/h8ck3r/gcrawl -w /go/src/github.com/h8ck3r/gcrawl -e GO111MODULE=$(GO111MODULE) -e GOOS=$(GOOS) -e GOARCH=$(GOARCH) --rm -it golang:1.13.6-alpine3.11 go test -v ./... | sed -e '/PASS/ s//$(shell printf "\033[32mPASS\033[0m")/' -e '/FAIL/ s//$(shell printf "\033[31mFAIL\033[0m")/' -e '/SKIP/ s//$(shell printf "\033[93mSKIP\033[0m")/'

bench:
	@docker run -v $$PWD:/go/src/github.com/h8ck3r/gcrawl -w /go/src/github.com/h8ck3r/gcrawl -e GO111MODULE=$(GO111MODULE) -e GOOS=$(GOOS) -e GOARCH=$(GOARCH) --rm -it golang:1.13.6-alpine3.11 go

clean:
	#@rm -vrf $(CONFDIR)
	#@rm -vrf $(BIN)
	#@rm -vrf $(LIBDIR)
	go clean -x -v
	go clean -x -v -cache
	go clean -x -v -testcache

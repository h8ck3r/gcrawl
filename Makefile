DOCKER_GOOS ?= $(GOOS)
DOCKER_GOARCH ?= $(GOARCH)
DOCKER_GO111MODULE := on
DOCKER_GOBIN := /go/bin
DOCKER_GOPATH := /go
DOCKER_GOROOT := /usr/local/go

BIN = $(CURDIR)/bin
PREFIX = $(CURDIR)
CONFDIR = $(PREFIX)/etc

GO = go
OUT = gcrawl
SRC = main.go

all: build

$(CONFDIR):
	@mkdir -p "$@"

$(CONFDIR)/%: $(CONFDIR)

config: $(CONFDIR)/gcrawl

build:
	@docker run -v $$PWD:/go/src/github.com/h8ck3r/gcrawl -w /go/src/github.com/h8ck3r/gcrawl -e GO111MODULE=$(GO111MODULE) -e GOOS=$(GOOS) -e GOARCH=$(GOARCH) --rm -it golang:1.13.6-alpine3.11 go build -x -v -o gcrawl main.go


GOOS ?= $(GOOS)
GOARCH ?= $(GOARCH)
GO111MODULE := on
GOBIN := /go/bin
GOPATH := /go
GOROOT := /usr/local/go

BIN = $(CURDIR)/bin
PREFIX = $(CURDIR)
CONFDIR = $(PREFIX)/etc

GO = go
OUT = gcrawl
SRC = main.go

$(CONFDIR):
	@mkdir -p "$@"

$(CONFDIR)/%: $(CONFDIR)

config: $(CONFDIR)/gcrawl

build:
	docker run -v $PWD:/go/src/gcrawl -it golang:1.13.6-alpine3.11


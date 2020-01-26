# vim: noexpandtab filetype=make
GIT_REVISION := $(shell git rev-parse HEAD | cut -c 1-10)
RELEASE_VERSION := $(or $(RELEASE_VERSION), $(or $(GIT_REVISION), dev))

.PHONY: build
build: configure
	go build cmd/webhug.go

.PHONY: image
image:
	docker build --build-arg RELEASE_VERSION=$(RELEASE_VERSION) \
		 -t webhug-action -t webhug-action:$(RELEASE_VERSION) \
		 --file ./Dockerfile .

.PHONY: configure
configure:
	go mod download

.PHONY: test
test: configure
	go test ./...


IMAGE ?= buzer/selenium-node-chromium-nightly-docker
TAG := $(shell date "+%Y%m%d")

all: docker

docker:	
	docker build -t $(IMAGE):$(TAG) .

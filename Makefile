NAME := credstash
NAMESPACE := marcelocorreia
VERSION := $(shell cat version)
SOURCE_GITHUB_USER := fugue
GITHUB_USER := marcelocorreia
GIT_REPO_NAME := docker-credstash
SCAFOLD := badwolf
ifdef GITHUB_TOKEN
TOKEN_FLAG := -H "Authorization: token $(GITHUB_TOKEN)"
endif

build: _update-version
	docker build -t $(NAMESPACE)/$(NAME) .
	docker build -t $(NAMESPACE)/$(NAME):$(VERSION) .
.PHONY: build

push:
	docker push $(NAMESPACE)/$(NAME)
	docker push $(NAMESPACE)/$(NAME):$(VERSION)

release:
	$(make) build push
	github-release release -u $(GITHUB_USER) -r $(REPO_NAME) --tag $(VERSION) --name $(VERSION)

_get-last-release:
	@$(eval export OUT=$(shell curl -s $(TOKEN_FLAG) https://api.github.com/repos/$(SOURCE_GITHUB_USER)/$(NAME)/tags | jq ".[]|.name" | head -n1 | sed 's/\"//g' | sed 's/v*//g'))
	@echo $(OUT)
	@echo $(OUT) > version

_update-version:
	cat Dockerfile | sed  "s/ARG $(NAME)_version=\".*\"/ARG $(NAME)_version=\"$(VERSION)\"/" > /tmp/Dockerfile.tmp
	cat /tmp/Dockerfile.tmp > Dockerfile
	rm /tmp/Dockerfile.tmp


define git_push
	-git add .
	-git commit -m "$1"
	-git push
endef

_readme:
	$(SCAFOLD) generate --resource-type readme .
	$(call  git_push,Updating: $(VERSION))

open-page:
	open https://github.com/$(GITHUB_USER)/$(GIT_REPO_NAME).git

test:
	docker run --rm  -v $(HOME)/.aws:/root/.aws --entrypoint /bin/sh $(NAMESPACE)/$(NAME)

# all: one two three
# 	@echo "$@ finished!"

# one two three:
# 	@echo "building $@..."
# 	sleep 1
# 	@echo "$@ finished!"

# all: one two
# 	echo "all"

# one:
# 	echo "build"
# two:
# 	echo "deploy"

# NAME = docker.harshadnarvkar:5000/yantrio/vespa
# VERSION = 0.1.0

# .PHONY: all build tag_latest push push_latest run last_built_date


TARGETS = target
SERVICE_NAME = beta-tab-redbook
SERVER_IP = luxdev.beta.tab.com.au

# GIT Variables
GIT_BRANCH = `git rev-parse --abbrev-ref HEAD`
GIT_APPVERSION = `git describe --tags --abbrev=0`
GIT_COMMITS = $(shell git log $(GIT_APPVERSION)..HEAD --oneline | wc -l | tr -d ' ')
GIT_REVID = `git rev-parse HEAD`
GIT_REVID_SHORT = `git rev-parse --short HEAD`
RELEASE = "$(GIT_APPVERSION)-$(GIT_COMMITS).$(GIT_BRANCH).$(GIT_REVID_SHORT)"
ARCHIVE_SOURCE = "tabcorp-online-$(RELEASE)"
ARCHIVE = $(ARCHIVE_SOURCE).tar.gz

all: build

#
# Clean and build
#
clean:
	@rm -rf RELEASE.txt


build:
	# docker build -t $(NAME):$(VERSION) --rm .
	docker build -t narvekarh/myapp1 .

archive: build
	@echo -e "$(GREEN)Archiving distribution to $(ARCHIVE)$(RESET)"
	@echo "$(RELEASE)" > dist/VERSION
	@mv dist www
	@tar -cf $(ARCHIVE) www/* www/.well-known

target:
	@mkdir target

publish: 
	@echo "$(GIT_COMMITS).$(GIT_BRANCH).$(GIT_REVID_SHORT)" > RELEASE.txt

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)

push_latest:
	docker push $(NAME):latest

run:
  # if [[ "$(docker images -q $(NAME):$(VERSION) 2> /dev/null)" == "" ]]; then
  #   docker run -it $(NAME):$(VERSION) /bin/bash
  # fi
	docker run -p 49160:3000 -d narvekarh/myapp1

last_built_date:
  docker inspect -f '{{ .Created }}' $(NAME):$(VERSION)


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

all: build

build:
	# docker build -t $(NAME):$(VERSION) --rm .
	docker build -t narvekarh/myapp1 .

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
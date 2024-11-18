#!/usr/bin/env just --justfile

DOCKER_AIDER_IMAGE := "paulgauthier/aider-full"

hello:
    @echo "hello world"

aider msg:
    docker pull {{DOCKER_AIDER_IMAGE}}:latest
    docker run -it --user $(id -u):$(id -g) --volume $(pwd):/app paulgauthier/aider-full --openai-api-key $OPENAI_API_KEY --attribute-commit-message-author --chat-prompt true architect --browser --cache
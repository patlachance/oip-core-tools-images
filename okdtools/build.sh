#!/usr/bin/env bash

# Setting variables
IMG_NAME=$(basename $(pwd))
IMG_NS=${IMG_NS:-oiprnd}
IMG_BASE_OS=${IMG_BASE_OS:-alpine}
IMG_TAG=${IMG_TAG:-$IMG_BASE_OS-latest}
GIT_TAG=$(git rev-parse --short HEAD)
BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')

# Let's go!
#docker build --no-cache=true \
docker build \
       	--build-arg BUILD_DATE=$BUILD_DATE \
       	--build-arg VCS_REF=$GIT_TAG \
       	-t $IMG_NS/$IMG_NAME:$IMG_TAG -f Dockerfile.$IMG_BASE_OS .


#!/bin/sh

IMAGE_NAME="jekyll-dev:latest"

if [[ "$1" == "rebuild" || "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
    docker build -t $IMAGE_NAME .
fi

docker run --rm -it -p '4000:4000' -v "$PWD:/srv" $IMAGE_NAME jekyll s -H 0.0.0.0

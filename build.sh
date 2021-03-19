#!/bin/bash

REPO="${1:-$(basename "$PWD")}"
VERSION="${2:-latest}"

TAG="${REPO}:${VERSION}"

echo $TAG

set -eux
docker build \
    -t "$TAG" \
    --build-arg BUILDKIT_INLINE_CACHE=1 \
    .

docker images | grep $REPO
docker run --rm $TAG
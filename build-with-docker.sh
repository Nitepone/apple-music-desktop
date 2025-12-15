#!/bin/bash
set -eo pipefail

declare -r DOCKERFILE_PATH="./build/apple-music-builder.dockerfile"
if ! test -n "${DOCKERIMAGE_NAME}"; then
    DOCKERIMAGE_NAME="apple-music-builder"
fi

function build_docker_image {
    docker build \
        --build-arg BUILDKIT_INLINE_CACHE=1 \
        --cache-from "${DOCKERIMAGE_NAME}:latest" \
        -f "${DOCKERFILE_PATH}" \
        -t "${DOCKERIMAGE_NAME}" \
        ./
    echo "Built Docker Image"
}

function run_build_script {
    local docker_cmd
    docker_cmd="./build.sh --deps && ./build.sh $*"
    docker run \
        -v "${PWD}:/wrk/pkg" \
        -w "/wrk/pkg" \
        "${DOCKERIMAGE_NAME}" \
        bash -c "$docker_cmd"
}

build_docker_image
run_build_script "$@"

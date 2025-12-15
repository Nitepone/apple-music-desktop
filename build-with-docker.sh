#!/bin/bash
set -eo pipefail

declare -r DOCKERFILE_PATH="./build/apple-music-builder.dockerfile"
declare -r DOCKERIMAGE_NAME="apple-music-builder"

function build_docker_image {
    docker build \
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

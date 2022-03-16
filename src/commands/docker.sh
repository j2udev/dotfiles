#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/docker-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/common-functions.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/docker-functions.sh

usage() {
  echo "
Dotfiles Manager

Version: $(cat "$DFM_DIR"/VERSION)

Usage:
  dfm docker [options] [flags]

Flags:
  -c, --container                   Override the default name of the container
  -d, --dockerfile                  Override the default Dockerfile used
  -b, --build-stage                 Override the default Dockerfile build stage
  -h, --help                        Show help for the specified command
  -m, --mount-path                  Override the default volume mount path (current working directory)
  -n, --no-cache                    Do not use the cache when building
  -i, --image                       Override the default image
  -l, --list                        List the available command options
  -r, --rm                          Will remove the container upon exit"
}

list_options() {
  echo "
Options:
  build                             Build the image locally
  exec                              Exec into a running container
  rm, remove                        Remove a stopped container
  run                               Run a container (defaults to running in interactive mode)
  start                             Start an existing container (defaults to starting in interactive mode)
"
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    build)
      export DFM_DOCKER_BUILD=true
      shift
      ;;
    -b|--build-stage)
      shift
      export DFM_DOCKER_BUILD_STAGE="$1"
      shift
      ;;
    -b=*|--build-stage=*)
      export DFM_DOCKER_BUILD_STAGE="${1#*=}"
      shift
      ;;
    -c|--container)
      shift
      export DFM_DOCKER_CONTAINER_NAME="$1"
      shift
      ;;
    -c=*|--container=*)
      export DFM_DOCKER_CONTAINER_NAME="${1#*=}"
      shift
      ;;
    -d|--dockerfile)
      shift
      export DFM_DOCKERFILE="$1"
      shift
      ;;
    -d=*|--dockerfile=*)
      export DFM_DOCKERFILE="${1#*=}"
      shift
      ;;
    exec)
      export DFM_DOCKER_EXEC=true
      shift
      ;;
    -h|--help)
      usage
      list_options
      exit 1
      ;;
    -i|--image)
      shift
      export DFM_DOCKER_IMAGE_NAME="$1"
      shift
      ;;
    -i=*|--image=*)
      export DFM_DOCKER_IMAGE_NAME="${1#*=}"
      shift
      ;;
    -l|--list)
      list_options
      exit 1
      ;;
    -m|--mount-path)
      shift
      case $1 in
        /*)
          export DFM_DOCKER_MOUNT_PATH="${1}"
          ;;
        *)
          export DFM_DOCKER_MOUNT_PATH="${PWD}/${1}"
          ;;
      esac
      shift
      ;;
    -m=*|--mount-path=*)
      case "${1#*=}" in
        /*)
          export DFM_DOCKER_MOUNT_PATH="${1#*=}"
          ;;
        *)
          export DFM_DOCKER_MOUNT_PATH="${PWD}/${1#*=}"
          ;;
      esac
      shift
      ;;
    -n|--no-cache)
      export DFM_DOCKER_NO_CACHE=true
      shift
      ;;
    -r|--rm)
      export DFM_TRANSIENT_CONTAINER=true
      shift
      ;;
    rm|remove)
      export DFM_DOCKER_REMOVE=true
      shift
      ;;
    run)
      export DFM_DOCKER_RUN=true
      shift
      ;;
    start)
      export DFM_DOCKER_START=true
      shift
      ;;
    *)
      printStatus "Unknown Option: $1" --status error
      usage
      list_options
      exit 1
      ;;
  esac
done

if "$DFM_DOCKER_BUILD" ; then
  dockerBuild
fi
if "$DFM_DOCKER_REMOVE" ; then
  dockerRemove
fi
if "$DFM_DOCKER_RUN" ; then
  dockerRun
fi
if "$DFM_DOCKER_START" ; then
  dockerStart
fi
if "$DFM_DOCKER_EXEC" ; then
  dockerExec
fi
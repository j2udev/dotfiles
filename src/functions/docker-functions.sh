#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/common-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/docker-variables.sh

dockerBuild() {
  printStatus "Building New Container..." --status info
  if "$DFM_DOCKER_NO_CACHE" ; then
    docker build --progress=plain --no-cache --target "$DFM_DOCKER_BUILD_STAGE" -t "$DFM_DOCKER_IMAGE_NAME" -f "$DFM_DIR"/"$DFM_DOCKERFILE" "$DFM_DIR"
  else
    docker build --progress=plain --target "$DFM_DOCKER_BUILD_STAGE" -t "$DFM_DOCKER_IMAGE_NAME" -f "$DFM_DIR"/"$DFM_DOCKERFILE" "$DFM_DIR"
  fi
}

dockerExec() {
  printStatus "Execing Into Container..." --status info
  docker container exec -it "$DFM_DOCKER_CONTAINER_NAME" /bin/zsh
}

dockerRemove() {
  printStatus "Removing Container..." --status info
  docker rm "$DFM_DOCKER_CONTAINER_NAME"
}

dockerRun() {
  printStatus "Running New Container..." --status info
  if "$DFM_TRANSIENT_CONTAINER" ; then
    docker run -ti \
      --rm \
      --network host \
      --name "$DFM_DOCKER_CONTAINER_NAME" \
      -v /var/run/docker.sock/:/var/run/docker.sock \
      "$DFM_DOCKER_IMAGE_NAME" /bin/zsh
      # -v "$DFM_DOCKER_MOUNT_PATH":/home/docker \
  else
    docker run -it \
      --network host \
      --name "$DFM_DOCKER_CONTAINER_NAME" \
      -v /var/run/docker.sock/:/var/run/docker.sock \
      -v "$DFM_DOCKER_MOUNT_PATH":/home/docker \
      "$DFM_DOCKER_IMAGE_NAME" /bin/zsh
  fi
}

dockerStart() {
  printStatus "Restarting Docker Container..." --status info
  docker start -ai "$DFM_DOCKER_CONTAINER_NAME"
}
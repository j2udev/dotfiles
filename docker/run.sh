#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

while [ "$#" -gt 0 ]; do
    case "$1" in
    --mount-path)
        shift
        MOUNT_PATH=$1
        shift
        ;;
    --image)
        shift
        IMAGE=$1
        shift
        ;;
    --container)
        shift
        CONTAINER=$1
        shift
        ;;
    *)
        echo "Unknown Flag: $1"
        exit 1
        ;;
    esac
done

[ -z "$MOUNT_PATH" ] && MOUNT_PATH="$PWD"
[ -z "$IMAGE" ] && IMAGE="j2udevelopment/dev-env"
[ -z "$CONTAINER" ] && CONTAINER="j2udevelopment-$(openssl rand -base64 6 | tr -dc A-Za-z0-9)"

docker run -it \
	--network host \
	--name "$CONTAINER" \
	-v /var/run/docker.sock/:/var/run/docker.sock \
	-v "$MOUNT_PATH":/root/dev \
	"$IMAGE" /bin/zsh


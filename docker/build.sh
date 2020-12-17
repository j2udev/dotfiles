#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

while [ "$#" -gt 0 ]; do
    case "$1" in
    --image)
        shift
        IMAGE=$1
        shift
        ;;
    *)
        echo "Unknown Flag: $1"
        exit 1
        ;;
    esac
done


[ -z "$IMAGE" ] && IMAGE="j2udevelopment/dev-env"

docker build -t "$IMAGE" -f Dockerfile ../

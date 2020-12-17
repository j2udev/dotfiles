#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

./print-status.sh "Select a Powerlevel10K Oh My Zsh profile you would like to use:" --status info
./print-status.sh "1) Spring"
./print-status.sh "2) WVU"
./print-status.sh "3) USA"

read -r P10K_PROFILE

case "$P10K_PROFILE" in
  1|2|3)
    source ./set-p10k-theme.sh "$P10K_PROFILE"
    ;;
  4)
    exit 1
    ;;
  *)
    ./print-status.sh "Unrecognized Option: $P10K_PROFILE" --status error
    exit 1
    ;;
esac

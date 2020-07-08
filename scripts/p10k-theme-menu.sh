#!/bin/bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"
WHITE_ON_GREEN="\033[37;42m"
WHITE_ON_RED="\033[37;41m"
END_OF_COLOR="\033[0m"

echo "$WHITE_ON_GREEN""Select a Powerlevel10K Oh My Zsh profile you would like to use:""$END_OF_COLOR""\n1)Spring\n2)WVU\n3)Quit"

read -r P10K_PROFILE

case $P10K_PROFILE in
  1|2 )
    ./set-p10k-theme.sh "$P10K_PROFILE"
    ;;
  3 )
    echo "$WHITE_ON_GREEN""Quitting...""$END_OF_COLOR";
    exit;;
  * )
    echo "$WHITE_ON_RED""Unrecognized Option""$END_OF_COLOR";
    exit;;
esac

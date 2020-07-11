#!/bin/bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

START_OF_COLOR="\033[37;"
WHITE_ON_GREEN=$START_OF_COLOR"42m"
WHITE_ON_RED=$START_OF_COLOR"41m"
END_OF_COLOR="\033[0m"

printf "$WHITE_ON_GREEN%s$END_OF_COLOR\n%s\n%s\n%s\n%s\n" "Select a Powerlevel10K Oh My Zsh profile you would like to use:" "1) Spring" "2) WVU" "3) USA" "4) Quit" 

read -r P10K_PROFILE

case $P10K_PROFILE in
  1|2|3 )
    ./set-p10k-theme.sh "$P10K_PROFILE"
    ;;
  4 )
    echo "$WHITE_ON_GREEN""Quitting...""$END_OF_COLOR";
    exit;;
  * )
    echo "$WHITE_ON_RED""Unrecognized Option""$END_OF_COLOR";
    exit;;
esac

#!/bin/bash
set -e

P10K_PROFILE=$1
START_OF_COLOR="\033[37;"
WHITE_ON_GREEN=$START_OF_COLOR"42m"
WHITE_ON_RED=$START_OF_COLOR"41m"
END_OF_COLOR="\033[0m"

cd "$(dirname "${BASH_SOURCE[0]}")"

printf "$WHITE_ON_GREEN%s$END_OF_COLOR\n%s\n%s\n%s\n%s\n" "Select a Powerlevel10K Oh My Zsh profile you would like to use:" "1) Spring" "2) WVU" "3) USA" "4) Quit" 


# This will backup any existing .p10k.zsh files to a .p10k_backup.zsh file
[[ -f ~/.p10k.zsh ]] && mv ~/.p10k.zsh ~/.p10k_backup.zsh

case $P10K_PROFILE in
  1 )
    printf "$WHITE_ON_GREEN%s$END_OF_COLOR\n" "Setting Spring Powerlevel10k Theme...";
    cp ../p10k/spring-p10k.zsh ~/.p10k.zsh
    ;;
  2 )
    printf "$WHITE_ON_GREEN%s$END_OF_COLOR\n" "Setting WVU Powerlevel10k Theme...";
    cp ../p10k/wvu-p10k.zsh ~/.p10k.zsh
    ;;
  3 )
    printf "$WHITE_ON_GREEN%s$END_OF_COLOR\n" "Setting USA Powerlevel10k Theme...";
    cp ../p10k/usa-p10k.zsh ~/.p10k.zsh
    ;;
  * )
    printf "$WHITE_ON_RED%s$END_OF_COLOR\n" "Unrecognized Option";
    ;;
esac

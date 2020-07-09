#!/bin/bash
set -e

P10K_PROFILE=$1
WHITE_ON_GREEN="\033[37;42m"
END_OF_COLOR="\033[0m"

cd "$(dirname "${BASH_SOURCE[0]}")"

# This will backup any existing .p10k.zsh files to a .p10k_backup.zsh file
[[ -f ~/.p10k.zsh ]] && mv ~/.p10k.zsh ~/.p10k_backup.zsh

case $P10K_PROFILE in
  1 )
    echo -e "$WHITE_ON_GREEN""Setting Spring Powerlevel10k Theme...""$END_OF_COLOR";
    cp ../p10k/spring-p10k.zsh ~/.p10k.zsh
    ;;
  2 )
    echo -e "$WHITE_ON_GREEN""Setting WVU Powerlevel10k Theme...""$END_OF_COLOR";
    cp ../p10k/wvu-p10k.zsh ~/.p10k.zsh
    ;;
  3 )
    echo -e "$WHITE_ON_GREEN""Setting USA Powerlevel10k Theme...""$END_OF_COLOR";
    cp ../p10k/usa-p10k.zsh ~/.p10k.zsh
    ;;
  * )
    echo -e "$WHITE_ON_GREEN""Unrecognized Option""$END_OF_COLOR";
    ;;
esac

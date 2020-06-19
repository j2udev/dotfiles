#!/bin/bash
set -e

P10K_PROFILE=$1
# shellcheck disable=SC2034
WHITE_ON_GREEN="\033[37;42m"
WHITE_ON_RED="\033[37;41m"
END_OF_COLOR="\033[0m"

cd "$(dirname "${BASH_SOURCE[0]}")"

# This will backup any existing .p10k.zsh files to the
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
  * )
    echo -e "$WHITE_ON_GREEN""Unrecognized Option""$END_OF_COLOR";
    ;;
esac

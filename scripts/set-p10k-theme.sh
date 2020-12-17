#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# This will backup any existing .p10k.zsh files to a .p10k_backup.zsh file
[ -f "$HOME"/.p10k.zsh ] && mv "$HOME"/.p10k.zsh "$HOME"/.p10k_backup.zsh

case "$P10K_PROFILE" in
  1)
    ./print-status.sh "Setting Spring Powerlevel10k Theme..." --status info
    cp ../p10k/spring-p10k.zsh "$HOME"/.p10k.zsh
    ;;
  2)
    ./print-status.sh "Setting WVU Powerlevel10k Theme..." --status info
    cp ../p10k/wvu-p10k.zsh "$HOME"/.p10k.zsh
    ;;
  3)
    ./print-status.sh "Setting USA Powerlevel10k Theme..." --status info
    cp ../p10k/usa-p10k.zsh "$HOME"/.p10k.zsh
    ;;
  *)
    ./print-status.sh "Unrecognized Option: $P10K_PROFILE" --status error
    ;;
esac

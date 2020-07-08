# Powerlevel10k
function p10k { sh $HOME/dotfiles/scripts/p10k-theme-menu.sh ; source $HOME/.zshrc }

# Docker
function drmig { docker rmi $(docker images | grep $1 | xargs -L2| awk '{print($3)}') }
function drmigf { docker rmi --force $(docker images | grep $1 | xargs -L2| awk '{print($3)}') }


# General
function af { alias | grep "$*" }

# Powerlevel10k
function prompt-theme { sh $HOME/dotfiles/scripts/p10k-theme-menu.sh ; source $HOME/.zshrc }

# Kubernetes
function kconm { cp ~/.kube/config ~/.kube/config.backup && KUBECONFIG=~/.kube/config:~/.kube/$1 kubectl config view --flatten > /tmp/config && mv /tmp/config ~/.kube/config }

# Docker
function drmig { docker rmi $(docker images | grep $1 | xargs -L2| awk '{print($3)}') }
function drmigf { docker rmi --force $(docker images | grep $1 | xargs -L2| awk '{print($3)}') }
function lint { docker run -e RUN_LOCAL=true -v $(pwd):/tmp/lint/ github/super-linter }




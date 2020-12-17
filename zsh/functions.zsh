# General
function af { alias | grep "$*" }

# Powerlevel10k
function prompt-theme { sh $HOME/dotfiles/scripts/p10k-theme-menu.sh ; source $HOME/.zshrc }

# Kubernetes
function kconm { cp ~/.kube/config ~/.kube/config.backup && KUBECONFIG=~/.kube/config:~/.kube/$1 kubectl config view --flatten > /tmp/config && mv /tmp/config ~/.kube/config }
function ksecd { printf $(kubectl get secret --namespace $3 $1 -o jsonpath="{.data.$2}" | base64 --decode);echo }

# Docker
function digr { docker images | grep $1  }
function drmig { docker rmi $(docker images | grep $1 | xargs -L2| awk '{print($3)}') }
function drmigf { docker rmi --force $(docker images | grep $1 | xargs -L2| awk '{print($3)}') }
function lint { docker run -e RUN_LOCAL=true -v $(pwd):/tmp/lint/ github/super-linter }
function lintf { docker run -e RUN_LOCAL=true -v $(pwd)$1:/tmp/lint/ github/super-linter }




# General
af() { alias | grep "$*" }

# Powerlevel10k
theme() { /bin/bash "$HOME"/dotfiles/scripts/p10k-theme-menu.sh ; source "$HOME"/.zshrc }

# Kubernetes
kconm() { cp "$HOME"/.kube/config "$HOME"/.kube/config.backup && KUBECONFIG="$HOME"/.kube/config:"$HOME"/.kube/$1 kubectl config view --flatten > /tmp/config && mv /tmp/config "$HOME"/.kube/config }
ksecd() { printf $(kubectl get secret --namespace "$1" "$2" -o jsonpath="{.data.$3}" | base64 --decode); echo }

# Docker
digr() { docker images | grep "$1" }
drmig() { docker rmi "$(docker images | grep $1 | xargs -L2| awk '{print($3)}')" }
drmigf() { docker rmi --force "$(docker images | grep $1 | xargs -L2| awk '{print($3)}')" }
lint() { docker run -e RUN_LOCAL=true -v "$(pwd)":/tmp/lint/ github/super-linter }
lintf() { docker run -e RUN_LOCAL=true -v "$(pwd)""$1":/tmp/lint/ github/super-linter }


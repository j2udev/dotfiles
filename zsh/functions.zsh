# General
af() { alias | fzf }
afg() { alias | rg "$*" }
lg() { ls -l | rg "$*" }
lf() { ls -l | fzf }
lsg() { ls | rg "$*" }

# Powerlevel10k
theme() { /bin/bash "$HOME"/dotfiles/scripts/p10k-theme-menu.sh ; source "$HOME"/.zshrc }

# Kubernetes
kconm() { cp "$HOME"/.kube/config "$HOME"/.kube/config.backup && KUBECONFIG="$HOME"/.kube/config:"$HOME"/.kube/$1 kubectl config view --flatten > /tmp/config && mv /tmp/config "$HOME"/.kube/config }
ksecd() { printf $(kubectl get secret --namespace "$1" "$2" -o jsonpath="{.data.$3}" | base64 --decode); echo }

# Docker
digr() { docker images | rg "$1" }
dif() { docker images | fzf }
drmig() { docker rmi "$(docker images | rg $1 | xargs -L2| awk '{print($3)}')" }
drmigf() { docker rmi --force "$(docker images | rg $1 | xargs -L2| awk '{print($3)}')" }
lint() { docker run -e RUN_LOCAL=true -v "$(pwd)":/tmp/lint/ github/super-linter }
lintf() { docker run -e RUN_LOCAL=true -v "$(pwd)""$1":/tmp/lint/ github/super-linter }

# Terraform
tfdestroy() { terraform refresh -var-file $1 ; terraform destroy -var-file $1 }

j2u() { docker run -it \
        --network host \
        --name ubuntu-dev-env \
        -v /var/run/docker.sock/:/var/run/docker.sock \
        -v "$PWD":/root/dev \
        j2udevelopment/dev-env /bin/zsh }

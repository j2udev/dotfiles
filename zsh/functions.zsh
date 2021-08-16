# General
af() { alias | fzf }
afg() { alias | rg "$*" }
lg() { ls -l | rg "$*" }
lf() { ls -l | fzf }
lsg() { ls | rg "$*" }
psg() { ps aux | rg "$*" }
psf() { ps aux | fzf }

# Powerlevel10k
theme() { /bin/bash "$HOME"/dotfiles/scripts/p10k-theme-menu.sh ; source "$HOME"/.zshrc }

# Kubernetes
kconm() { cp "$HOME"/.kube/config "$HOME"/.kube/config.backup && KUBECONFIG="$HOME"/.kube/config:"$HOME"/.kube/$1 kubectl config view --flatten > /tmp/config && mv /tmp/config "$HOME"/.kube/config && chmod 600 ~/.kube/config }
kcong() { aws eks update-kubeconfig --name "$1" --kubeconfig "$HOME"/.kube/"$2" }
ksecd() { printf $(kubectl get secret --namespace "$1" "$2" -o jsonpath="{.data.$3}" | base64 --decode); echo }

# Docker
dif() { docker images | fzf }
digr() { docker images | rg "$1" }
digrx() { docker images | rg "$1" | xargs -L1 | awk '{print($3)}' }
drmig() { docker images | rg "$1" | awk '{print($3)}' | xargs -L1 docker rmi }
drmigf() { docker images | rg "$1" | awk '{print($3)}' | xargs -L1 docker rmi --force }
# drmigf() { docker rmi --force "$(docker images | grep "$1" | xargs -L1 | awk '{print($3)}')" }
# drmigf() { docker rmi --force "$(docker images -f=reference="*$1*" -q)" }
lint() { docker run --rm -e RUN_LOCAL=true -v "$(pwd)":/tmp/lint/ github/super-linter }
lintKruise() {

}
lintGo() { docker run --rm \
        -e RUN_LOCAL=true \
        -e VALIDATE_MARKDOWN=true \
        -e VALIDATE_GO=true \
        -v "$(pwd)":/tmp/lint/ github/super-linter }


# Terraform
tfdestroy() { terraform refresh -var-file $1 ; terraform destroy -var-file $1 }

j2u() { docker run -it \
        --network host \
        --name ubuntu-dev-env \
        -v /var/run/docker.sock/:/var/run/docker.sock \
        -v "$PWD":/root/dev \
        j2udevelopment/dev-env /bin/zsh }

# Git
mergeUpstream() {
  git fetch upstream
  git checkout "$1"
  git pull
  git merge upstream/"$1"
}


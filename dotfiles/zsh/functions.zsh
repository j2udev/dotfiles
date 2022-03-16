# General
af() { alias | fzf }
afg() { alias | rg "$*" }
lg() { ls -l | rg "$*" }
lf() { ls -l | fzf }
lsg() { ls | rg "$*" }
psg() { ps aux | rg "$*" }
psf() { ps aux | fzf }
follow() {ls -l $(which "$1")}
decode() {echo "$1" | base64 --decode}
encode() {echo "$1" | base64}

# Powerlevel10k
# theme() { /bin/bash "$HOME"/dotfiles/scripts/p10k-theme-menu.sh ; source "$HOME"/.zshrc }
theme() { dfm theme "$1" ; source "$HOME"/.zshrc }

# AWS
deleteS3Bucket() {
  aws s3api delete-objects \
    --bucket "$1" \
    --delete "$(aws s3api list-object-versions \
      --bucket $1 \
      --output=json \
      --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
  aws s3api delete-objects \
    --bucket "$1" \
    --delete "$(aws s3api list-object-versions \
      --bucket $1 \
      --output=json \
      --query='{Objects: DeleteMarkers[].{Key:Key,VersionId:VersionId}}')"
  aws s3 rb s3://"$1" --force
}

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
lintGo() { docker run --rm \
        -e RUN_LOCAL=true \
        -e VALIDATE_MARKDOWN=true \
        -e VALIDATE_GO=true \
        -v "$(pwd)":/tmp/lint/ github/super-linter }


# Terraform
tfdestroy() { terraform refresh -var-file $1 ; terraform destroy -var-file $1 }
tgo() {
  terragrunt output -json kubeconfig | jq -r . | tee "$HOME"/.kube/"$1" \
    && chmod 600 "$HOME"/.kube/"$1"
}
tgom() {
  terragrunt output -json kubeconfig | jq -r . | tee ~/.kube/"$1" \
    && chmod 600 ~/.kube/"$1" \
    && cp "$HOME"/.kube/config "$HOME"/.kube/config.backup && KUBECONFIG="$HOME"/.kube/config:"$HOME"/.kube/$1 kubectl config view --flatten > /tmp/config && mv /tmp/config "$HOME"/.kube/config && chmod 600 ~/.kube/config
}

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

curlAndUntar() {
  if [[ "$2" ]] ; then
    curl -L "$1" | tar xzf - -C "$2"
  else
    curl -L "$1" | tar xzf - -C /usr/local/bin
  fi
}


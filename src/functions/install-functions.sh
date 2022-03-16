#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/common-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/install-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/init-functions.sh

dryRunInstallMessage () {
  printStatus "Dry run installation of $1..." --status info
}

installMessage() {
  printStatus "Installing $1..." --status info
}

alreadyInstalledMessage() {
  printStatus "$1 Installation found, use --overwrite to overwrite existing version. Continuing..." --status warn
}

installMessages() {
  if "$DFM_INSTALL_DRY_RUN" ; then
    dryRunInstallMessage "$1"
  else
    installMessage "$1"
  fi
}

curlAndUntar() {
  local arg_arr=(
    curl "$DFM_CURL_FLAGS" -L "$1"
    "|"
    "$DFM_SUDO" tar xzf - -C "$DFM_INSTALL_PATH"
  )
  if "$DFM_INSTALL_DRY_RUN" ; then
    echo "${arg_arr[@]}"
  else
    eval "${arg_arr[@]}"
  fi
}

gitCheckout() {
  local arg_arr=(
    "git fetch --all --tags"
    "&&"
    "git checkout tags/$1"
  )
  if "$DFM_INSTALL_DRY_RUN" ; then
    echo "${arg_arr[@]}"
  else
    eval "${arg_arr[@]}"
  fi
}

gitClone() {
  local arg_arr=(
    git clone --branch "$1" --depth 1 "$2" "$3"
  )
  if [ "$DFM_INSTALL_OVERWRITE" ] && [ -d "$3" ] ; then
    cd "$3" && gitCheckout "$1"
    # rm -r "$3"
  else
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${arg_arr[@]}"
    else
      eval "${arg_arr[@]}"
    fi
  fi
}

curlAndUnzip() {
  local arg_arr=(
    curl "$DFM_CURL_FLAGS" -L "$1" ">" /tmp/"$2"
    "&&"
    "$DFM_SUDO" unzip -q -o /tmp/"$2" -d "$DFM_INSTALL_PATH"
  )
  if "$DFM_INSTALL_DRY_RUN" ; then
    echo "${arg_arr[@]}"
  else
    eval "${arg_arr[@]}"
  fi
}

curlAndChmod() {
  local arg_arr=(
    curl "$DFM_CURL_FLAGS" -Lo "$DFM_SHARE_PATH"/"$1" "$2"
    "&&"
    "$DFM_SUDO" chmod +x "$DFM_SHARE_PATH"/"$1"
  )
  if "$DFM_INSTALL_DRY_RUN" ; then
    echo "${arg_arr[@]}"
  else
    eval "${arg_arr[@]}"
  fi
}

symlinkBinary() {
  if [ "$(basename "$1")" != "*" ] ; then
    local arg_arr=(
      "$DFM_SUDO" ln -fs "$1" "$DFM_SHARE_PATH"/"$(basename "$1")"
    )
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${arg_arr[@]}"
    else
      eval "${arg_arr[@]}"
    fi
  else
    printStatus "Loop over the tool's bin folder and symlink each file" --status warn
  fi
}

symlinkBinaries() {
  for f in $1 ; do
    symlinkBinary "$f"
  done
}

# shellcheck disable=SC2086
installDocker() {
  installMessages "Docker"
  local curl_arr
  if [ ! -f "/usr/share/keyrings/docker-archive-keyring.gpg" ] ; then
    curl_arr=(
      curl "$DFM_CURL_FLAGS" -fL https://download.docker.com/linux/ubuntu/gpg
      "|"
      "$DFM_SUDO" gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
      "&&"
    )
  fi
  local install_arr=(
    "${curl_arr[@]}"
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu groovy stable"
    "|"
    "$DFM_SUDO" tee /etc/apt/sources.list.d/docker.list "> /dev/null"
    "&&"
    "$DFM_SUDO" apt-get update
    "&&"
    "$DFM_SUDO" apt-get install -y docker-ce docker-ce-cli containerd.io
  )
  if "$DFM_INSTALL_DRY_RUN" ; then
    if [ "$DFM_OPERATING_SYSTEM" == "darwin" ] ; then
      printStatus "Not yet available" --status warn
    elif [ "$DFM_OPERATING_SYSTEM" == "linux" ] ; then
      echo "${install_arr[@]}"
    fi
  else
    if [ "$DFM_OPERATING_SYSTEM" == "darwin" ] ; then
      printStatus "Not yet available" --status warn
    elif [ "$DFM_OPERATING_SYSTEM" == "linux" ] ; then
      eval "${install_arr[@]}"
      # TODO: installing docker from binaries is complicated and needs more work
      # curl -L https://download.docker.com/linux/static/stable/x86_64/docker-"$DFM_DOCKER_VERSION".tgz | $DFM_SUDO tar xzf - -C "$DFM_INSTALL_PATH" && \
      # $DFM_SUDO cp "$DFM_INSTALL_PATH"/docker/* "$DFM_SHARE_PATH" && \
      # $DFM_SUDO dockerd
    fi
  fi
}

# shellcheck disable=SC2086
installFzf() {
  installMessages "Fzf"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_FZF_VERSION="$DFM_INSTALL_VERSION"
  fi
  gitClone "$DFM_FZF_VERSION" "https://github.com/junegunn/fzf.git" "$HOME/.fzf"
  if ! "$DFM_INSTALL_DRY_RUN" ; then
    $HOME/.fzf/install --all
  fi
}

# shellcheck disable=SC2086
installGolang() {
  installMessages "Go"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_GOLANG_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndUntar \
    "https://golang.org/dl/go$DFM_GOLANG_VERSION.$DFM_OPERATING_SYSTEM-amd64.tar.gz"
  symlinkBinaries \
    "$DFM_INSTALL_PATH/go/bin/*"
}

# shellcheck disable=SC2086
installGradle() {
  installMessages "Gradle"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_GRADLE_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndUnzip \
    "https://services.gradle.org/distributions/gradle-$DFM_GRADLE_VERSION-bin.zip" \
    gradle.zip
  symlinkBinary \
    "$DFM_INSTALL_PATH/gradle-$DFM_GRADLE_VERSION/bin/gradle"
}

# shellcheck disable=SC2086
installHelm() {
  installMessages "Helm"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_HELM_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndUntar \
    "https://get.helm.sh/helm-v$DFM_HELM_VERSION-$DFM_OPERATING_SYSTEM-amd64.tar.gz"
  symlinkBinary \
    "$DFM_INSTALL_PATH/$DFM_OPERATING_SYSTEM-amd64/helm"
}

# shellcheck disable=SC2086
installHugo() {
  installMessages "Hugo"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_HUGO_VERSION="$DFM_INSTALL_VERSION"
  fi
  [ "$DFM_OPERATING_SYSTEM" == "darwin" ] && local DFM_OPERATING_SYSTEM="macOS"
  [ "$DFM_OPERATING_SYSTEM" == "linux" ] && local DFM_OPERATING_SYSTEM="Linux"
  local DFM_INSTALL_PATH="$DFM_SHARE_PATH"
  curlAndUntar \
    "https://github.com/gohugoio/hugo/releases/download/v$DFM_HUGO_VERSION/hugo_""$DFM_HUGO_VERSION""_$DFM_OPERATING_SYSTEM-64bit.tar.gz"
}

# shellcheck disable=SC2086
installIstio() {
  installMessages "Istio"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_ISTIO_VERSION="$DFM_INSTALL_VERSION"
  fi
  [ "$DFM_OPERATING_SYSTEM" == "darwin" ] && local DFM_OPERATING_SYSTEM="osx"
  [ "$DFM_OPERATING_SYSTEM" == "linux" ] && local DFM_OPERATING_SYSTEM="linux-amd64"
  curlAndUntar \
    "https://github.com/istio/istio/releases/download/$DFM_ISTIO_VERSION/istio-$DFM_ISTIO_VERSION-$DFM_OPERATING_SYSTEM.tar.gz"
  symlinkBinary \
    "$DFM_INSTALL_PATH/istio-$DFM_ISTIO_VERSION/bin/istioctl"
}

# shellcheck disable=SC2086
installJava() {
  installMessages "Java"
  [ "$DFM_OPERATING_SYSTEM" == "darwin" ] && local DFM_OPERATING_SYSTEM="mac"
  curlAndUntar \
    "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.9.1%2B1/OpenJDK11U-jdk_x64_""$DFM_OPERATING_SYSTEM""_hotspot_11.0.9.1_1.tar.gz"
  if [ "$DFM_OPERATING_SYSTEM" == "darwin" ] ; then
    symlinkBinaries \
      "$DFM_INSTALL_PATH/jdk-11.0.9.1+1/Contents/Home/bin/*"
  elif [ "$DFM_OPERATING_SYSTEM" == "linux" ] ; then
    symlinkBinaries \
      "$DFM_INSTALL_PATH/jdk-11.0.9.1+1/bin/*"
  fi
}

# shellcheck disable=SC2086
installKind() {
  installMessages "Kind"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_KIND_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndChmod \
    "kind" \
    "https://kind.sigs.k8s.io/dl/v$DFM_KIND_VERSION/kind-$DFM_OPERATING_SYSTEM-amd64"
}

# shellcheck disable=SC2086
installKubectl() {
  installMessages "Kubectl"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_KUBECTL_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndChmod \
    "kubectl" \
    "https://storage.googleapis.com/kubernetes-release/release/v$DFM_KUBECTL_VERSION/bin/$DFM_OPERATING_SYSTEM/amd64/kubectl"
}

installLsd() {
  installMessages "Lsd"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_LSD_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndUntar \
    "https://github.com/Peltoche/lsd/releases/download/$DFM_LSD_VERSION/lsd-$DFM_LSD_VERSION-x86_64-unknown-linux-gnu.tar.gz"
  symlinkBinary \
    "$DFM_INSTALL_PATH/lsd-0.20.1-x86_64-unknown-linux-gnu/lsd"
}

# shellcheck disable=SC2086
installMinikube() {
  installMessages "Minikube"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_MINIKUBE_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndChmod \
    "minikube" \
    "https://storage.googleapis.com/minikube/releases/v$DFM_MINIKUBE_VERSION/minikube-$DFM_OPERATING_SYSTEM-amd64"
}

# shellcheck disable=SC2086
installNeovim() {
  installMessages "Neovim"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_NEOVIM_VERSION="$DFM_INSTALL_VERSION"
  fi
  [ "$DFM_OPERATING_SYSTEM" == "darwin" ] && local DFM_OPERATING_SYSTEM="macos"
  [ "$DFM_OPERATING_SYSTEM" == "linux" ] && local DFM_OPERATING_SYSTEM="linux64"
  curlAndUntar \
    "https://github.com/neovim/neovim/releases/download/v$DFM_NEOVIM_VERSION/nvim-$DFM_OPERATING_SYSTEM.tar.gz"
  symlinkBinary \
    "$DFM_INSTALL_PATH/nvim-$DFM_OPERATING_SYSTEM/bin/nvim"
  if "$DFM_INSTALL_INIT" ; then
    # [[ -d "$HOME"/.config/nvim ]] || mkdir -p "$HOME"/.config/nvim
    # ln -fs "$DFM_DOTFILES"/nvim/init.vim "$HOME"/.config/nvim/init.vim
    printStatus "installing vim plug" -s info
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    initNeovim
  fi
}

# shellcheck disable=SC2086
installNode() {
  installMessages "NodeJS"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_NODE_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndUntar \
    "https://nodejs.org/dist/v$DFM_NODE_VERSION/node-v$DFM_NODE_VERSION-$DFM_OPERATING_SYSTEM-x64.tar.gz"
  symlinkBinaries \
    "$DFM_INSTALL_PATH/node-v$DFM_NODE_VERSION-$DFM_OPERATING_SYSTEM-x64/bin/*"
}

# shellcheck disable=SC2086
installPowerlevel10k() {
  installMessages "Powerlevel10k"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_P10K_VERSION="$DFM_INSTALL_VERSION"
  fi
  gitClone "v$DFM_P10K_VERSION" "https://github.com/romkatv/powerlevel10k.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  if "$DFM_INSTALL_INIT" ; then
    initPowerlevel10k
  fi
}

# shellcheck disable=SC2086
installSkaffold() {
  installMessages "Skaffold"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_SKAFFOLD_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndChmod \
    "skaffold" \
    "https://storage.googleapis.com/skaffold/releases/v$DFM_SKAFFOLD_VERSION/skaffold-$DFM_OPERATING_SYSTEM-amd64"
  local skaffold_arr=(
    "skaffold config set --global collect-metrics false > /dev/null 2>&1"
  )
  if "$DFM_INSTALL_DRY_RUN" ; then
    echo "${skaffold_arr[@]}"
  else
    eval "${skaffold_arr[@]}"
  fi
}

# shellcheck disable=SC2086
installTerraform() {
  installMessages "Terraform"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_TERRAFORM_VERSION="$DFM_INSTALL_VERSION"
  fi
  local DFM_INSTALL_PATH="$DFM_SHARE_PATH"
  curlAndUnzip \
    "https://releases.hashicorp.com/terraform/""$DFM_TERRAFORM_VERSION""/terraform_""$DFM_TERRAFORM_VERSION""_""$DFM_OPERATING_SYSTEM""_amd64.zip" \
    terraform.zip
}

# shellcheck disable=SC2086
installYarn() {
  installMessages "Yarn"
  if [[ "$DFM_INSTALL_VERSION" && ! "$1" ]] ; then
    local DFM_YARN_VERSION="$DFM_INSTALL_VERSION"
  fi
  curlAndUntar \
    "https://github.com/yarnpkg/yarn/releases/download/v$DFM_YARN_VERSION/yarn-v$DFM_YARN_VERSION.tar.gz"
  symlinkBinaries \
    "$DFM_INSTALL_PATH/yarn-v$DFM_YARN_VERSION/bin/*"
  local yarn_arr=(
      "yarn config set prefix $DFM_SHARE_PATH/../"
  )
  if "$DFM_INSTALL_DRY_RUN" ; then
    echo "${yarn_arr[@]}"
  else
    eval "${yarn_arr[@]}"
  fi
}

installZsh() {
  installMessages "Zsh"
  if "$DFM_INSTALL_INIT" ; then
    initZsh
  fi
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)" "" -d /usr/local -e yes
  if [ ! -d "$HOME"/.oh-my-zsh ] || "$DFM_INSTALL_OVERWRITE" ; then
    rm -rf "$HOME"/.oh-my-zsh
    yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
    gitClone "v$DFM_ZSH_AUTOSUGGESTIONS_VERSION" "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  else
    printStatus ".oh-my-zsh already exists..." --status warn
  fi
}

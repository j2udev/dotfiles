#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/common-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/version-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/install-variables.sh

versionMessage() {
  if [ $# -eq 2 ] && [ "$(command -v "$2")" ] ; then
    printStatus "$1 Version" --status info
  elif [ $# -eq 1 ] && [ "$(command -v "$1")" ] ; then
    printStatus "$1 Version" --status info
  else
    printStatus "$1 Version" --status error
  fi
}

dockerVersionCheck() {
  local version_arr=(
    docker version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Docker" "docker"
      "${version_arr[@]}"
    fi
  fi
}

fzfVersionCheck() {
  local version_arr=(
    fzf --version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Fzf" "fzf"
      "${version_arr[@]}"
    fi
  fi
}

golangVersionCheck() {
  local version_arr=(
    go version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Go" "go"
      "${version_arr[@]}"
    fi
  fi
}

gradleVersionCheck() {
  local version_arr=(
    gradle -v
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Gradle" "gradle"
      "${version_arr[@]}"
    fi
  fi
}

helmVersionCheck() {
  local version_arr=(
    helm version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Helm" "helm"
      "${version_arr[@]}"
    fi
  fi
}

hugoVersionCheck() {
  local version_arr=(
    hugo version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Hugo" "hugo"
      "${version_arr[@]}"
    fi
  fi
}

istioVersionCheck() {
  local version_arr=(
    istioctl version --remote=false
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Istio" "istioctl"
      "${version_arr[@]}"
    fi
  fi
}

javaVersionCheck() {
  local version_arr=(
    java --version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Java" "java"
      "${version_arr[@]}"
    fi
  fi
}

kindVersionCheck() {
  local version_arr=(
    kind version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Kind" "kind"
      "${version_arr[@]}"
    fi
  fi
}

kubectlVersionCheck() {
  local version_arr=(
    kubectl version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Kubectl" "kubectl"
      "${version_arr[@]}"
    fi
  fi
}

minikubeVersionCheck() {
  local version_arr=(
    minikube version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Minikube" "minikube"
      "${version_arr[@]}"
    fi
  fi
}

neovimVersionCheck() {
  local version_arr=(
    nvim -v
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Neovim" "nvim"
      "${version_arr[@]}"
    fi
  fi
}

nodeVersionCheck() {
  local node_version_arr=(
    node -v
  )
  local npm_version_arr=(
    npm -v
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
        echo "${node_version_arr[@]}"
        echo "${npm_version_arr[@]}"
    else
      versionMessage "NodeJS" "node"
      "${node_version_arr[@]}"
      versionMessage "NPM" "npm"
      "${npm_version_arr[@]}"
    fi
  fi
}

skaffoldVersionCheck() {
  local version_arr=(
    skaffold version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Skaffold" "skaffold"
      "${version_arr[@]}"
    fi
  fi
}

terraformVersionCheck () {
  local version_arr=(
    terraform version
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Terraform" "terraform"
      "${version_arr[@]}"
    fi
  fi
}

yarnVersionCheck() {
  local version_arr=(
    yarn -v
  )
  if [ "$DFM_INSTALL_SHOW_VERSION" ] ; then
    if "$DFM_INSTALL_DRY_RUN" ; then
      echo "${version_arr[@]}"
    else
      versionMessage "Yarn" "yarn"
      "${version_arr[@]}"
    fi
  fi
}

versionCheck() {
  local DFM_INSTALL_SHOW_VERSION=true
  dockerVersionCheck
  istioVersionCheck
  javaVersionCheck
  gradleVersionCheck
  nodeVersionCheck
  yarnVersionCheck
  kubectlVersionCheck
  helmVersionCheck
  skaffoldVersionCheck
  kindVersionCheck
  minikubeVersionCheck
}
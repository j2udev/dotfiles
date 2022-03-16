#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/install-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/common-functions.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/install-functions.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/version-functions.sh

usage() {
  echo "
Dotfiles Manager

Version: $(cat "$DFM_DIR"/VERSION)

Usage:
  dfm install [options] [flags]

Flags:
  -A, --all                     Install the entire tool stack
  -a, --all-versions            Check the versions of all available options
  -C, --curl-flags              Specify additional flags for the curl installs
  -r, --dry-run                 Perform a dry run for the specified arguments
  -h, --help                    Show help for the specified command
  -i, --init                    Symlink init.vim
  -I, --install-path            Override the default install path
  -l, --list                    List the available command options
  -o, --overwrite               Overwrite existing tool installations if encountered
  -p, --path                    Override the default install and share paths
  -s, --sudo                    Install tools with sudo privileges
  -S, --share-path              Override the default share path
  -V, --show-tool-versions      Show the version of tools as installation steps are performed
  -v, --version                 Override the default installation version
  -W, --wget-flags              Specify additional flags for the wget installs
  "
}

list_options() {
  echo "
Options:
  docker                        Install Docker
  fzf                           Install Fzf
  go, golang                    Install Golang
  gradle                        Install Gradle
  helm                          Install Helm
  hugo                          Install Hugo
  istio                         Install Istio and Istioctl
  java                          Install Java
  kind                          Install Kind
  kubectl                       Install Kubectl
  lsd                           Install Lsd
  minikube                      Install Minikube
  nvim, neovim                  Install Neovim
  node, nodejs                  Install NodeJS
  p10k, powerlevel10k           Install Powerlevel10k
  skaffold                      Install Skaffold
  terraform                     Install Terraform
  yarn                          Install Yarn
  zsh                           Install Zsh/OhMyZsh
"
}

shopt -s extglob

option_counter=0
booleanFlagRegex='^[\-][AaiorsV]{1,7}$'

booleanFlagCheck() {
  if [[ "$1" =~ [A] ]] ; then
      export DFM_INSTALL_ALL=true
  fi
  if [[ "$1" =~ [a] ]] ; then
      export DFM_INSTALL_VERSION_CHECK=true
  fi
  if [[ "$1" =~ [i] ]] ; then
      export DFM_INSTALL_INIT=true
  fi
  if [[ "$1" =~ [o] ]] ; then
      export DFM_INSTALL_OVERWRITE=true
  fi
  if [[ "$1" =~ [r] ]] ; then
      export DFM_INSTALL_DRY_RUN=true
  fi
  if [[ "$1" =~ [s] ]] ; then
      export DFM_SUDO="sudo"
  fi
  if [[ "$1" =~ [V] ]] ; then
      export DFM_INSTALL_SHOW_VERSION=true
  fi
}

# shellcheck disable=SC2254
while [ "$#" -gt 0 ]; do
  if [[ "$1" =~ $booleanFlagRegex ]] ; then
      booleanFlagCheck "$1"
      shift
  else
    case "$1" in
      -A|--all)
        export DFM_INSTALL_ALL=true
        shift
        ;;
      -a|--all-versions)
        export DFM_INSTALL_VERSION_CHECK=true
        shift
        ;;
      --curl-flags)
        shift
        export DFM_CURL_FLAGS="$1"
        shift
        ;;
      --curl-flags=*)
        export DFM_CURL_FLAGS="${1#*=}"
        shift
        ;;
      docker)
        export DFM_INSTALL_DOCKER=true
        (( option_counter++ ))
        shift
        ;;
      --dry-run)
        export DFM_INSTALL_DRY_RUN=true
        shift
        ;;
      fzf)
        export DFM_INSTALL_FZF=true
        (( option_counter++ ))
        shift
        ;;
      go|golang)
        export DFM_INSTALL_GOLANG=true
        (( option_counter++ ))
        shift
        ;;
      gradle)
        export DFM_INSTALL_GRADLE=true
        (( option_counter++ ))
        shift
        ;;
      -h|--help)
        usage
        list_options
        exit 1
        ;;
      helm)
        export DFM_INSTALL_HELM=true
        (( option_counter++ ))
        shift
        ;;
      hugo)
        export DFM_INSTALL_HUGO=true
        (( option_counter++ ))
        shift
        ;;
      -i|--init)
        export DFM_INSTALL_INIT=true
        (( option_counter++ ))
        shift
        ;;
      -I|--install-path)
        shift
        case $1 in
          /*)
            export DFM_INSTALL_PATH="${1}"
            ;;
          *)
            export DFM_INSTALL_PATH="${PWD}/${1}"
            ;;
        esac
        shift
        ;;
      -I=*|--install-path=*)
        case "${1#*=}" in
          /*)
            export DFM_INSTALL_PATH="${1#*=}"
            ;;
          *)
            export DFM_INSTALL_PATH="${PWD}/${1#*=}"
            ;;
        esac
        shift
        ;;
      istio)
        export DFM_INSTALL_ISTIO=true
        (( option_counter++ ))
        shift
        ;;
      java)
        export DFM_INSTALL_JAVA=true
        (( option_counter++ ))
        shift
        ;;
      kind)
        export DFM_INSTALL_KIND=true
        (( option_counter++ ))
        shift
        ;;
      kubectl)
        export DFM_INSTALL_KUBECTL=true
        (( option_counter++ ))
        shift
        ;;
      -l|--list)
        list_options
        exit 1
        ;;
      lsd)
        export DFM_INSTALL_LSD=true
        (( option_counter++ ))
        shift
        ;;
      minikube)
        export DFM_INSTALL_MINIKUBE=true
        (( option_counter++ ))
        shift
        ;;
      nvim|neovim)
        export DFM_INSTALL_NVIM=true
        (( option_counter++ ))
        shift
        ;;
      node|nodejs)
        export DFM_INSTALL_NODE=true
        (( option_counter++ ))
        shift
        ;;
      -o|--overwrite)
        export DFM_INSTALL_OVERWRITE=true
        shift
        ;;
      -p|--path)
        shift
        case $1 in
          /*)
            export DFM_INSTALL_PATH="${1}"
            export DFM_SHARE_PATH="${1}"
            ;;
          *)
            export DFM_INSTALL_PATH="${PWD}/${1}"
            export DFM_SHARE_PATH="${PWD}/${1}"
            ;;
        esac
        shift
        ;;
      -p=*|--path=*)
        case "${1#*=}" in
          /*)
            export DFM_INSTALL_PATH="${1#*=}"
            export DFM_SHARE_PATH="${1#*=}"
            ;;
          *)
            export DFM_INSTALL_PATH="${PWD}/${1#*=}"
            export DFM_SHARE_PATH="${PWD}/${1#*=}"
            ;;
        esac
        shift
        ;;
      p10k|powerlevel10k)
        export DFM_INSTALL_P10K=true
        (( option_counter++ ))
        shift
        ;;
      -s|--sudo)
        export DFM_SUDO="sudo"
        shift
        ;;
      -S|--share-path)
        shift
        case $1 in
          /*)
            export DFM_SHARE_PATH="${1}"
            ;;
          *)
            export DFM_SHARE_PATH="${PWD}/${1}"
            ;;
        esac
        shift
        ;;
      -S=*|--share-path=*)
        case "${1#*=}" in
          /*)
            export DFM_SHARE_PATH="${1#*=}"
            ;;
          *)
            export DFM_SHARE_PATH="${PWD}/${1#*=}"
            ;;
        esac
        shift
        ;;
      skaffold)
        export DFM_INSTALL_SKAFFOLD=true
        (( option_counter++ ))
        shift
        ;;
      terraform)
        export DFM_INSTALL_TERRAFORM=true
        (( option_counter++ ))
        shift
        ;;
      -V|--show-tools-version)
        export DFM_INSTALL_SHOW_VERSION=true
        shift
        ;;
      -v|--version)
        shift
        export DFM_INSTALL_VERSION="$1"
        shift
        ;;
      -v=*|--version=*)
        export DFM_INSTALL_VERSION="${1#*=}"
        shift
        ;;
      --wget-flags)
        shift
        export DFM_WGET_FLAGS="$1"
        shift
        ;;
      --wget-flags=*)
        export DFM_WGET_FLAGS="${1#*=}"
        shift
        ;;
      yarn)
        export DFM_INSTALL_YARN=true
        (( option_counter++ ))
        shift
        ;;
      zsh)
        export DFM_INSTALL_ZSH=true
        (( option_counter++ ))
        shift
        ;;
      *)
        [ -n "$1" ] && printStatus "Unknown Option: $1" --status error
        # printStatus "Unknown Option: $1" --status error
        usage
        list_options
        exit 1
        ;;
    esac
  fi
done

if [[ ($option_counter -gt 1 && "$DFM_INSTALL_VERSION") || ("$DFM_ALL_DEPLOYMENTS" == true && "$DFM_INSTALL_VERSION") ]] ; then
  printStatus "Cannot use more than one option with the version flag." --status error
  exit 1
fi

operatingSystemFilter "$(uname -s)"

if "$DFM_INSTALL_DOCKER" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installDocker && \
    dockerVersionCheck
  else
    if [ "$(command -v docker)" ] ; then
      alreadyInstalledMessage "Docker"
      dockerVersionCheck
    else
      installDocker
      dockerVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_NVIM" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installNeovim
    neovimVersionCheck
  else
    if [ "$(command -v nvim)" ] ; then
      alreadyInstalledMessage "Neovim"
      neovimVersionCheck
    else
      installNeovim
      neovimVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_ZSH" ; then
  # installOhMyZsh
  installZsh
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_FZF" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installFzf
    fzfVersionCheck
  else
    if [ "$(command -v fzf)" ] ; then
      alreadyInstalledMessage "Fzf"
      fzfVersionCheck
    else
      installFzf
      fzfVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_P10K" ; then
  installPowerlevel10k
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_LSD" ; then
  installLsd
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_JAVA" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installJava
    javaVersionCheck
  else
    if [ "$(command -v java)" ] ; then
      alreadyInstalledMessage "Java"
      javaVersionCheck
    else
      installJava
      javaVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_GOLANG" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installGolang
    golangVersionCheck
  else
    if [ "$(command -v go)" ] ; then
      alreadyInstalledMessage "Go"
      golangVersionCheck
    else
      installGolang
      golangVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_GRADLE" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installGradle
    gradleVersionCheck
  else
    if [ "$(command -v gradle)" ] ; then
      alreadyInstalledMessage "Gradle"
      gradleVersionCheck
    else
      installGradle
      gradleVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_NODE" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installNode
    nodeVersionCheck
  else
    if [ "$(command -v node)" ] ; then
      alreadyInstalledMessage "NodeJS"
      nodeVersionCheck
    else
      installNode
      nodeVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_YARN" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installYarn
    yarnVersionCheck
  else
    if [ "$(command -v yarn)" ] ; then
      alreadyInstalledMessage "Yarn"
      yarnVersionCheck
    else
      installYarn
      yarnVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_KUBECTL" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installKubectl
    kubectlVersionCheck
  else
    if [ "$(command -v kubectl)" ] ; then
      alreadyInstalledMessage "Kubectl"
      kubectlVersionCheck
    else
      installKubectl
      kubectlVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_HELM" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installHelm
    helmVersionCheck
  else
    if [ "$(command -v helm)" ] ; then
      alreadyInstalledMessage "Helm"
      helmVersionCheck
    else
      installHelm
      helmVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_SKAFFOLD" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installSkaffold
    skaffoldVersionCheck
  else
    if [ "$(command -v skaffold)" ] ; then
      alreadyInstalledMessage "Skaffold"
      skaffoldVersionCheck
    else
      installSkaffold
      skaffoldVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_ISTIO" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installIstio
    istioVersionCheck
  else
    if [ "$(command -v istioctl)" ] ; then
      alreadyInstalledMessage "Istio"
      istioVersionCheck
    else
      installIstio
      istioVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_KIND" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installKind
    kindVersionCheck
  else
    if [ "$(command -v kind)" ] ; then
      alreadyInstalledMessage "Kind"
      kindVersionCheck
    else
      installKind
      kindVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_MINIKUBE" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installMinikube
    minikubeVersionCheck
  else
    if [ "$(command -v minikube)" ] ; then
      alreadyInstalledMessage "Minikube"
      minikubeVersionCheck
    else
      installMinikube
      minikubeVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_HUGO" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installHugo
    hugoVersionCheck
  else
    if [ "$(command -v hugo)" ] ; then
      alreadyInstalledMessage "Hugo"
      hugoVersionCheck
    else
      installHugo
      hugoVersionCheck
    fi
  fi
fi
if "$DFM_INSTALL_VERSION_CHECK" ; then
  versionCheck
fi
if "$DFM_INSTALL_ALL" || "$DFM_INSTALL_TERRAFORM" ; then
  if "$DFM_INSTALL_OVERWRITE" || "$DFM_INSTALL_DRY_RUN" ; then
    installTerraform
    terraformVersionCheck
  else
    if [ "$(command -v terraform)" ] ; then
      alreadyInstalledMessage "Terraform"
      terraformVersionCheck
    else
      installTerraform
      terraformVersionCheck
    fi
  fi
fi

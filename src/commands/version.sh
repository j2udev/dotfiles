#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/version-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/common-functions.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/version-functions.sh

usage() {
  echo "
Dotfiles Manager

Version: $(cat "$DFM_DIR"/VERSION)

Usage:
  dfm version [options] [flags]

Flags:
  -A, --all                     Show the versions for all of the tools in the stack
  -h, --help                    Show help for the specified command
  -l, --list                    List the available command options"
}

list_options() {
  echo "
Options:
  docker                        Check the Docker version
  gradle                        Check the Gradle version
  helm                          Check the Helm version
  hugo                          Check the Hugo version
  istio                         Check the Istio version
  java                          Check the Java version
  kind                          Check the Kind version
  kubectl                       Check the Kubectl version
  minikube                      Check the Minikube version
  node, nodejs                  Check the NodeJS version
  skaffold                      Check the Skaffold version
  terraform                     Check the Terraform version
  yarn                          Check the Yarn version
  "
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -A|--all)
      export DFM_SHOW_ALL_VERSIONS=true
      shift
      ;;
    docker)
      export DFM_SHOW_DOCKER_VERSION=true
      shift
      ;;
    gradle)
      export DFM_SHOW_GRADLE_VERSION=true
      shift
      ;;
    -h|--help)
      usage
      list_options
      exit 1
      ;;
    helm)
      export DFM_SHOW_HELM_VERSION=true
      shift
      ;;
    hugo)
      export DFM_SHOW_HUGO_VERSION=true
      shift
      ;;
    istio)
      export DFM_SHOW_ISTIO_VERSION=true
      shift
      ;;
    java)
      export DFM_SHOW_JAVA_VERSION=true
      shift
      ;;
    kind)
      export DFM_SHOW_KIND_VERSION=true
      shift
      ;;
    kubectl)
      export DFM_SHOW_KUBECTL_VERSION=true
      shift
      ;;
    -l|--list)
      list_options
      exit 1
      ;;
    minikube)
      export DFM_SHOW_MINIKUBE_VERSION=true
      shift
      ;;
    node|nodejs)
      export DFM_SHOW_NODE_VERSION=true
      shift
      ;;
    skaffold)
      export DFM_SHOW_SKAFFOLD_VERSION=true
      shift
      ;;
    terraform)
      export DFM_SHOW_TERRAFORM_VERSION=true
      shift
      ;;
    yarn)
      export DFM_SHOW_YARN_VERSION=true
      shift
      ;;
    *)
      printStatus "Unknown Option: $1" --status error
      usage
      list_options
      exit 1
      ;;
  esac
done

export DFM_INSTALL_SHOW_VERSION=true

if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_DOCKER_VERSION" ; then
  dockerVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_ISTIO_VERSION" ; then
  istioVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_JAVA_VERSION" ; then
  javaVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_GRADLE_VERSION" ; then
  gradleVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_NODE_VERSION" ; then
  nodeVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_YARN_VERSION" ; then
  yarnVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_KUBECTL_VERSION" ; then
  kubectlVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_HELM_VERSION" ; then
  helmVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_SKAFFOLD_VERSION" ; then
  skaffoldVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_MINIKUBE_VERSION" ; then
  minikubeVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_KIND_VERSION" ; then
  kindVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_HUGO_VERSION" ; then
  hugoVersionCheck
fi
if "$DFM_SHOW_ALL_VERSIONS" || "$DFM_SHOW_TERRAFORM_VERSION" ; then
  terraformVersionCheck
fi
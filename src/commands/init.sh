#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/init-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/common-functions.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/functions/init-functions.sh

usage() {
  echo "
Dotfiles Manager

Version: $(cat "$DFM_DIR"/VERSION)

Usage:
  dfm init [options] [flags]

Flags:
  -A, --all                         Initialize all options
  -h, --help                        Show help for the specified command
  -l, --list                        List the available command options
  -p, --path                        Path to the dotfiles repository ($HOME/dotfiles)"
}

list_options() {
  echo "
Options:
  dotfiles                           Initialize dotfiles (symlink dotfiles)
  nvim                              Initialize Neovim config (symlink init.vim)
  p10k                              Initialize Powerlevel10k config (symlink .p10k.zsh)
  zsh                               Initialize Zsh config (cp .zshrc)
"
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -A|--all)
      export DFM_INIT_ALL=true
      shift
      ;;
    dotfiles)
      export DFM_INIT_DOTFILES=true
      shift
      ;;
    -h|--help)
      usage
      list_options
      exit 1
      ;;
    -l|--list)
      list_options
      exit 1
      ;;
    nvim)
      export DFM_INIT_NVIM=true
      shift
      ;;
    -p|--path)
      shift
      case $1 in
        /*)
          export DFM_INIT_PATH="${1}"
          ;;
        *)
          export DFM_INIT_PATH="${PWD}/${1}"
          ;;
      esac
      shift
      ;;
    -p=*|--path=*)
      case "${1#*=}" in
        /*)
          export DFM_INIT_PATH="${1#*=}"
          ;;
        *)
          export DFM_INIT_PATH="${PWD}/${1#*=}"
          ;;
      esac
      shift
      ;;
    p10k)
      export DFM_INIT_P10K=true
      shift
      ;;
    zsh)
      export DFM_INIT_ZSH=true
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

if "$DFM_INIT_ALL" || "$DFM_INIT_DOTFILES" ; then
  initDotfiles
fi
if "$DFM_INIT_ALL" || "$DFM_INIT_ZSH" ; then
  initZsh
fi
if "$DFM_INIT_ALL" || "$DFM_INIT_P10K" ; then
  initPowerlevel10k
fi
if "$DFM_INIT_ALL" || "$DFM_INIT_NVIM" ; then
  initNeovim
fi
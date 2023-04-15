export EDITOR="nvim"
# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
# ZSH
# For more zsh configuration variables visit https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"
# If using starship, set the ZSH_THEME to an empty string
# export ZSH_THEME=""
# Vim
export MYVIMRC="$HOME/.config/nvim/init.vim"
# Docker
export DOCKER_HOST="unix://$HOME/.rd/docker.sock"
# Kubernetes
export KUBECONFIG="$HOME/.kube/config"
export KUBE_EDITOR="nvim"
# FZF
export FZF_BASE=/usr/local/opt/fzf/install
export FZF_DEFAULT_COMMAND="rg --files --hidden"
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :100 {}'"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}'"
# AWS
export AWS_SDK_LOAD_CONFIG=true
# Java
export JAVA_8_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_331.jdk/Contents/Home"
export JAVA_11_HOME="$HOME/bin/jdk-11.0.15+10/Contents/Home"
export JAVA_17_HOME="$HOME/bin/jdk/Contents/Home"
export JAVA_HOME=$JAVA_17_HOME
# Go
export GOROOT="$HOME/bin/go-1.20"
export GOBIN="$GOROOT/bin"
export GOPATH="$HOME/go-path"
# Python
export PYTHONBIN="/Users/wardjl/Library/Python/3.10/bin"
export POETRYBIN="$HOME/.local/bin"
# NPM
export NPMBIN="/opt/node-v14.18.1-darwin-x64/bin"
# Zarf
export ZARF_CONFIG="$XDG_CONFIG_HOME/zarf/config.yaml"

export PATH="$HOME/bin:/usr/local/bin:$POETRYBIN:$GOBIN:$PYTHONBIN:$NPMBIN:$PATH"

export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH
export EDITOR="nvim"
# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
# ZSH
export ZSH="$HOME/.oh-my-zsh"
# Vim
export MYVIMRC="$HOME/.config/nvim/init.vim"
export XDG_CONFIG_HOME="$HOME/.config"
# Kubernetes
export KUBECONFIG="$HOME/.kube/config"
export KUBE_EDITOR="nvim"
# FZF
export FZF_BASE=/usr/local/opt/fzf/install
export FZF_DEFAULT_COMMAND="rg --files --hidden"
# AWS
export AWS_SDK_LOAD_CONFIG=true
# Java
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
export JAVA_11_HOME=/opt/jdk-11.0.9.1+1/Contents/Home/
# export JAVA_11_HOME=$HOME/bin/jdk-11.0.9.1+1/Contents/Home/
export JAVA_13_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-13.jdk/Contents/Home/
export JAVA_HOME=$JAVA_11_HOME
# Go
export GOPATH=/usr/local/Cellar/go/1.15.6

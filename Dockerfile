FROM ubuntu:20.04 as base
# Give the shell some color
ENV TERM xterm-256color
ENV XDG_CONFIG_HOME "$HOME/.config"
ENV TIMEZONE US/Eastern
# Change default shell to bash
SHELL ["/bin/bash", "-c"]

RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
# Install sudo
RUN apt update && apt install -y sudo
# Create a non-root user
RUN adduser --disabled-password --gecos '' docker
# Add new user to sudo group
RUN adduser docker sudo
# Do not prompt sudoers for password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# Switch to new user
USER docker
# # Facilitates using man and info
# RUN yes | sudo unminimize

# Standard installs
RUN sudo apt update && sudo apt install -y \
      software-properties-common \
      apt-transport-https \
      ca-certificates \
      gnupg2 \
      python3-pip

RUN sudo apt-add-repository \
      ppa:ansible/ansible

# Install additional tools
RUN sudo apt install -y \
    man \
    info \
    curl \
    wget \
    unzip \
    git \
    vim \
    zsh \
    ansible \
    direnv \
    dnsutils \
    watch \
    lsof \
    ripgrep \
    jq \
    htop \
    && sudo rm -rf /var/lib/apt/lists/*

# Take ownership of the common installation directories
RUN sudo chown -R docker:docker /opt
RUN sudo chown -R docker:docker /usr/local
# Set working directory
WORKDIR /home/docker
# Copy repo to /home/docker
COPY --chown=docker:docker . dotfiles
# Create directories for future steps
RUN mkdir .config && \
    mkdir .config/nvim
# Symlink dfm to the path to be used anywhere
RUN ln -fs /home/docker/dotfiles/bin/dfm /usr/local/bin/dfm
RUN dfm init dotfiles && \
    dfm init nvim && \
    dfm install zsh -i && \
    dfm install neovim -i && \
    dfm install p10k -i && \
    dfm install fzf && \
    dfm install lsd && \
    dfm install docker -sV && \
    dfm install istio -V && \
    dfm install java -V && \
    dfm install gradle -V && \
    dfm install nodejs -V && \
    dfm install yarn -V && \
    dfm install kubectl -V && \
    dfm install helm -V && \
    dfm install skaffold -V && \
    dfm install kind -V && \
    dfm install minikube -V && \
    dfm install terraform -V && \
    dfm install golang -V && \
    dfm install hugo -V

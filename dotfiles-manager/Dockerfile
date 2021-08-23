FROM ubuntu:20.10 as base
# Give the shell some color
ENV TERM xterm-256color
# Change default shell to bash
SHELL ["/bin/bash", "-c"]
# Install sudo
RUN apt-get update && apt-get install -y sudo
# Create a non-root user
RUN adduser --disabled-password --gecos '' docker
# Add new user to sudo group
RUN adduser docker sudo
# Do not prompt sudoers for password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# Switch to new user
USER docker
# Facilitates using man and info
RUN yes | sudo unminimize
# Install some default utils
RUN sudo apt-get update && sudo apt-get install -y \
    man \
    info \
    curl \
    wget \
    unzip \
    git \
    vim \
    nano \
    zsh \
    watch \
    lsof \
    ripgrep \
    jq \
    htop \
    autojump \
    python3-pygments \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common

# Take ownership of the common installation directories
RUN sudo chown -R docker:docker /opt
RUN sudo chown -R docker:docker /usr/local
# Set working directory
WORKDIR /home/docker
# Copy dfm to standard XDG_CONFIG_HOME
RUN mkdir .config
COPY --chown=docker:docker . .config/dotfiles-manager
# COPY . /opt/dotfiles-manager/
# RUN cp -r /opt/dotfiles-manager/dotfiles /home/docker/.config/dotfiles/
# RUN cp .config/dotfiles-manager/dotfiles/zsh/.zshrc /home/docker/.zshrc
# RUN cp /opt/dotfiles-manager/dotfiles/zsh/.zshrc /home/docker/.zshrc
# RUN cp -r /opt/dotfiles-manager/.dotfiles /home/docker/dotfiles/

# Symlink dfm to the path to be used anywhere
RUN ln -fs /home/docker/.config/dotfiles-manager/bin/dfm /usr/local/bin/dfm
# RUN sudo ln -fs /opt/dotfiles-manager/bin/dfm /usr/local/bin/dfm
# Install development environment
RUN dfm install zsh -i && \
    dfm install neovim -i && \
    dfm install fzf && \
    dfm install p10k -i && \
    dfm install lsd
    # dfm install docker -sV && \
    # dfm install istio -V && \
    # dfm install java -V && \
    # dfm install gradle -V && \
    # dfm install nodejs -V && \
    # dfm install yarn -V && \
    # dfm install kubectl -V && \
    # dfm install helm -V && \
    # dfm install skaffold -V && \
    # dfm install kind -V && \
    # dfm install minikube -V && \
    # dfm install terraform -V && \
    # dfm install golang -V && \
    # dfm install hugo -V && \

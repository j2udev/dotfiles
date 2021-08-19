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
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common
# Copy dfm to the default install path
COPY . /opt/dotfiles-manager/
RUN cp /opt/dotfiles-manager/config/.zshrc /home/docker/.zshrc
RUN cp -r /opt/dotfiles-manager/.dotfiles /home/docker/dotfiles/
# Symlink dfm to the path to be used anywhere
RUN sudo ln -fs /opt/dotfiles-manager/bin/dfm /usr/local/bin/dfm
# Take ownership of the common installation directories
RUN sudo chown -R docker:docker /opt
RUN sudo chown -R docker:docker /usr/local
# Install development environment
RUN dfm install docker -sV && \
    dfm install zsh && \
    dfm install neovim -V && \
    dfm install fzf -V && \
    dfm install p10k
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

# Set working directory
WORKDIR /home/docker

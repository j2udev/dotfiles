FROM ubuntu:20.10
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

RUN mkdir -p /home/docker/dotfiles
RUN mkdir -p /home/docker/.config/nvim
RUN mkdir -p /home/docker/.config/coc/extensions

COPY zsh/.zshrc /home/docker/
COPY fzf/.fzf-key-bindings.zsh /home/docker/
COPY p10k/wvu-p10k.zsh /home/docker/.p10k.zsh
COPY nvim/ /home/docker/.config/nvim
COPY coc/ /home/docker/.config/coc/extensions
COPY ./ /home/docker/dotfiles

# Take ownership of common tool installation paths
RUN sudo chown -R docker:docker /opt && \
    sudo chown -R docker:docker /usr/local/bin && \
    sudo chown -R docker:docker /usr/local/share && \
    sudo chown -R docker:docker /home/docker

RUN set -eux \
    && sudo apt-get install -y \
    curl \
    gpg \
    apt-transport-https \
    ca-certificates \
    lsb-release \
    jq \
    net-tools \
    ssh \
    sudo \
    unzip \
    vim \
    git \
    watch \
    zsh \
    fzf \
    ripgrep \
    htop \
    neovim \
    nodejs \
    autojump \
    python3-pygments

# Install Docker
RUN set -eux \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Install Yarn
RUN set -eux \
    && curl -L https://github.com/yarnpkg/yarn/releases/download/v1.22.10/yarn-v1.22.10.tar.gz | tar xzf - -C /opt \
    && ln -fs /opt/yarn-v1.22.10/bin/yarn /usr/local/bin/yarn
# RUN set -eux \
#     && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#     && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
#     && apt-get update \
#     && apt-get install -y yarn

# Install LSD
RUN set -eux \
    && curl -sL https://github.com/Peltoche/lsd/releases/download/0.19.0/lsd-0.19.0-x86_64-unknown-linux-gnu.tar.gz | sudo tar -xz -C /opt \
    && sudo ln -s /opt/lsd-0.19.0-x86_64-unknown-linux-gnu/lsd /usr/local/bin/lsd

RUN set -eux \
    &&   yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
    # && sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)" "" -d /usr/local -e yes

RUN set -eux \
    && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-/home/docker/.oh-my-zsh/custom}"/themes/powerlevel10k

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
    && ~/.fzf/install --all

# # Install Powerlevel10k
# RUN set -eux \
#     && yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc \
#     && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-/home/docker/.oh-my-zsh/custom}"/themes/powerlevel10k

# RUN set -eux \
#     && sed -i s/"local key_bindings\=\"\/usr\/share\/doc\/fzf\/examples\/key-bindings.zsh\""/"local key_bindings\=\"\/home/docker\/.fzf-key-bindings.zsh\""/ /home/docker/.oh-my-zsh/plugins/fzf/fzf.plugin.zsh

RUN set -eux \
    && cd /home/docker/.config/coc/extensions \
    && yarn install

WORKDIR /home/docker

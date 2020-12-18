FROM ubuntu:20.10

ENV TERM xterm-256color

RUN mkdir /root/dotfiles
RUN mkdir -p /root/.config/nvim
RUN mkdir -p /root/.config/coc/extensions

COPY zsh/.zshrc /root/
COPY fzf/.fzf-key-bindings.zsh /root/
COPY p10k/wvu-p10k.zsh /root/.p10k.zsh
COPY nvim/ /root/.config/nvim
COPY coc/ /root/.config/coc/extensions
COPY ./ /root/dotfiles

RUN set -eux \
    && apt-get update -y \
    && apt-get install -y \
    curl \
    docker.io \
    gpg \
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

RUN set -eux \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

RUN set -eux \
    && curl -sL https://github.com/Peltoche/lsd/releases/download/0.19.0/lsd-0.19.0-x86_64-unknown-linux-gnu.tar.gz | sudo tar -xz -C /opt \
    && sudo ln -s /opt/lsd-0.19.0-x86_64-unknown-linux-gnu/lsd /usr/local/bin/lsd

RUN set -eux \
    && yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc \
    && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}"/themes/powerlevel10k

RUN set -eux \
    && sed -i s/"local key_bindings\=\"\/usr\/share\/doc\/fzf\/examples\/key-bindings.zsh\""/"local key_bindings\=\"\$HOME\/.fzf-key-bindings.zsh\""/ $HOME/.oh-my-zsh/plugins/fzf/fzf.plugin.zsh

RUN set -eux \
    && cd $HOME/.config/coc/extensions \
    && yarn install

WORKDIR /root/dev

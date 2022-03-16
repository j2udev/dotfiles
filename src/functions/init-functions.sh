#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/common-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/init-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/theme-variables.sh

initDotfiles() {
  printStatus "Initializing Dotfiles..." --status info
  mkdir -p "$HOME"/.config &> /dev/null
  ln -fs "$DFM_INIT_PATH"/dotfiles "$HOME"/.config
}

initNeovim() {
  printStatus "Initializing Neovim..." --status info
  mkdir -p "$HOME"/.config/nvim &> /dev/null
  ln -fs "$HOME"/.config/dotfiles/nvim/init.vim "$HOME"/.config/nvim/init.vim
  if [ "$(command -v nvim)" ] ; then
    # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
    printStatus "nvim headless pluginstall starting" -s info
    # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim --headless +PlugClean +PlugInstall +qa
    # nvim --headless +PlugInstall +qall
    printStatus "nvim headless pluginstall done" -s info
    # nvim +'PlugInstall --sync' +qa
    # nvim +PlugClean +PlugInstall +qa
  fi
}

initPowerlevel10k() {
  printStatus "Initializing Powerlevel10k..." --status info
  ln -fs "$HOME"/.config/dotfiles/p10k/"$DFM_THEME_DEFAULT" "$HOME"/.p10k.zsh
}

initZsh() {
  printStatus "Initializing Zsh..." --status info
  cp "$HOME"/.config/dotfiles/zsh/.zshrc "$HOME"/.zshrc
}

#!/bin/bash
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/common-variables.sh
# shellcheck source=/dev/null
. "$DFM_SRC"/variables/theme-variables.sh

themeSpring() {
  printStatus "Setting Spring Theme..." --status info
  ln -fs "$DFM_THEME_DIR/spring-p10k.zsh" "$HOME/.p10k.zsh"
}

themeUSA() {
  printStatus "Setting USA Theme..." --status info
  ln -fs "$DFM_THEME_DIR/usa-p10k.zsh" "$HOME/.p10k.zsh"
}

themeWVU() {
  printStatus "Setting WVU Theme..." --status info
  ln -fs "$DFM_THEME_DIR/wvu-p10k.zsh" "$HOME/.p10k.zsh"
}

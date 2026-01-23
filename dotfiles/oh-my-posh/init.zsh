# oh-my-posh prompt initialization
if command -v oh-my-posh &> /dev/null; then
    eval "$(oh-my-posh init zsh --config "${DOTFILES}/oh-my-posh/themes/db2.omp.json")"
fi

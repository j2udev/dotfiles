# Dotfiles

![Lint Code Base](https://github.com/j2udevelopment/dotfiles/workflows/Lint%20Code%20Base/badge.svg)

## [iTerm2](https://www.iterm2.com/)

```bash
brew cask install iterm2
```

Import the desired iterm profile theme from the `dotfiles/iterm` folder.  
You will need to update the font after installing Nerd Fonts in subsequent
steps.

The iTerm profiles in this repository take advantage of natural text editing.
This means that you can jump forward and backward using the option key. You can
combine these jumps with delete or backspace. You can also jump to the beginning
of the line with cmd + &#8592;

![iTerm](assets/iterm-natural-text-editing.gif)

## [Oh My Zsh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Copy the `zsh/.zshrc` file to your home directory.

Modify the path in the `.zshrc` to be:

```bash
export ZSH="/Users/<YOUR_USER>/.oh-my-zsh"
```

## [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set your `ZSH_THEME` variable as:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

If you are using an existing `.zshrc` rather than the one in this repo, you will
need to add the following to your copy:

```bash
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
```

Copy the desired theme from the `dotfiles/p10k` folder to the home directory.

```bash
cp -r ./<CHOSEN_THEME.zsh> ~/.p10k.zsh
```

## [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

In order to use the custom symbols and command prompt from my themes, you'll
need to install Nerd Fonts. You can either install them yourself or let the p10k
configuration wizard do it for you.

To manually install run the below:

```bash
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

If you choose this option, you'll need to manually set the font in your iTerm
preferences. Open iTerm preferences with:  
`cmd + ,` and go to Profiles -> Text -> Font  
Select `Hack Nerd Font Mono` from the dropdown.

To let the p10k configuration wizard do the font installation, run the below and
follow the prompt until it installs the needed fonts:

> Note: you do not need to go through the entire configuration wizard. Simply
> answer yes when prompted about installing the `MesloLGS NF` font.

```bash
p10k configure
```

If you choose this option, the `MesloLGS NF` should be automatically selected
from the font dropdown. Either of the above fonts will work well.

Restart iTerm.

## [LSD(LSDeluxe)](https://github.com/Peltoche/lsd)

```bash
brew install lsd
```

Uncomment the LSD aliases in the `~/.zshrc` or add them if you have an existing
`.zshrc`.

```bash
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
```

## [FZF (command-line fuzzy finder)](https://github.com/junegunn/fzf)

```bash
brew install fzf
```

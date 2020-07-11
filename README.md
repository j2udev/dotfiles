# Dotfiles

![Lint Code Base](https://github.com/j2udevelopment/dotfiles/workflows/Lint%20Code%20Base/badge.svg)

Clone this repo to your `$HOME` directory as it relies on that fact in order to
source different files in `dotfiles/zsh/.zshrc`.

```zsh
cd $HOME && git clone https://github.com/j2udevelopment/dotfiles.git
```

When using this repo on a work machine, I keep a `$HOME/.zshrc` that sources my
`$HOME/dotfiles/zsh/.zshrc`. This allows me to add any aliases, exports, etc
that may contain proprietary information without impacting my open source
dotfiles.  
An example of a `$HOME/.zshrc` file for a work machine:

```zsh
[[ -f $HOME/dotfiles/zsh/.zshrc ]] && source $HOME/dotfiles/zsh/.zshrc

### Proprietary Exports ###
export FOOBAR="/foo/bar"
### Proprietary Aliases ###
alias foobar="foo bar"
### Other Proprietary Information ###
```

## [iTerm2](https://www.iterm2.com/)

```zsh
brew cask install iterm2
```

Import the desired iterm profile theme from the `dotfiles/iterm/profiles`
folder.  
You will need to update the font after installing Nerd Fonts in subsequent
steps.

The iTerm profiles in this repository take advantage of natural text editing.
This means that you can jump forward and backward using the option key. You can
combine these jumps with delete or backspace. You can also jump to the beginning
or end of a line with cmd + &#8592; or &#8594; respectively.  
This will only work if you remove the
[vi-mode](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode) plugin
in `dotfiles/zsh/plugins.zsh`. This plugin adds vi keybinds to the command line.

![iTerm](assets/iterm-natural-text-editing.gif)

## [Oh My Zsh](https://ohmyz.sh/)

```zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Create your own `$HOME/.zshrc` file and add the following block as previously
mentioned:

```zsh
[[ -f $HOME/dotfiles/zsh/.zshrc ]] && source $HOME/dotfiles/zsh/.zshrc
```

## [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set your `ZSH_THEME` variable as:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Run the following function defined in `dotfiles/zsh/functions.zsh` to set a
preconfigured Powerlevel10k command prompt:

```zsh
prompt-theme
```

or run the following in order to use the Powerlevel10k configuration wizard:

```zsh
p10k configure
```

## [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

In order to use the custom symbols and command prompt from my themes, you'll
need to install Nerd Fonts. You can either install them yourself or let the p10k
configuration wizard do it for you.

To manually install run the below:

```zsh
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

```zsh
p10k configure
```

If you choose this option, the `MesloLGS NF` should be automatically selected
from the font dropdown. Either of the above font packages will work well.

Restart iTerm.

## [LSD(LSDeluxe)](https://github.com/Peltoche/lsd)

```zsh
brew install lsd
```

Uncomment the LSD aliases in the `~/.zshrc` or add them if you have an existing
`.zshrc`.

```zsh
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
```

## [FZF (command-line fuzzy finder)](https://github.com/junegunn/fzf)

```zsh
brew install fzf
```

## [Autojump](https://github.com/wting/autojump)

```zsh
brew install autojump
```

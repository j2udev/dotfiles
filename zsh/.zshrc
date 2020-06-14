# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/bin/idea:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wardjl/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         brew
         kubectl
         minikube
         helm
         gradle
         docker
         vscode
         extract
         fzf
         terraform)


source $ZSH/oh-my-zsh.sh

# Set fzf installation directory path
export FZF_BASE=/usr/local/opt/fzf/install

# Appends every command to the history file once it is executed
unsetopt inc_append_history
# Reloads the history whenever you use it
unsetopt share_history

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

## General
alias src="source ~/.zshrc"
alias zim="vim ~/.zshrc"
alias record="termtosvg -t ~/dotfiles/termtosvg/p10k-template.svg"
alias arec="asciinema rec"
alias aplay="asciinema play"
# Uncomment the below if using LSD
# alias ls='lsd'
# alias l='ls -l'
# alias la='ls -a'
# alias lla='ls -la'
# alias lt='ls --tree'

## OSX Specific - Toogle Show/Hide Hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"

## Java
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
export JAVA_HOME=$JAVA_11_HOME
alias java8='export JAVA_HOME=$JAVA_8_HOME; java -version'
alias java11='export JAVA_HOME=$JAVA_11_HOME; java -version'

## Minikube
alias mk='minikube'
alias mks='minikube service'
alias mkdd='eval $(minikube docker-env)'

## Kubernetes
autoload -U compinit && compinit #used to enable kubectx and kubens autocompletion
export KUBECONFIG=~/.kube/config
alias wkgp='watch kubectl get pods -A'
alias kgpw='kubectl get pods -A -w'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ke='kubectl edit'
alias netshoot='kubectl run --rm --generator=run-pod/v1 networking-shell -i --tty --image nicolaka/netshoot -- /bin/bash'
alias krmevictions='kubectl get pods -A | grep Evicted | awk "{print \$2}" | xargs -L1 kubectl delete pods'

## Docker
alias doc='docker'
alias dk='docker kill'
alias dkall='docker kill $(docker ps -aq)'
alias drm='docker rm'
alias drmi='docker rmi -f'
alias drmall='docker rm $(docker ps -aq)'
alias drmid='docker rmi $(docker images -f "dangling=true" -q)'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -aq'
alias dn='docker network'
alias dnls='docker network ls'

## Terraform
alias tf="terraform"
alias tfwl="terraform workspace list"
alias tfws="terraform workspace select"

## Gradle
alias gw='./gradlew'
alias gwc='./gradlew clean'
alias gwb='./gradlew build'
alias gwcb='./gradlew clean build'
alias gwcbp='./gradlew clean build publish'
alias gwpml='./gradlew publishToMavenLocal'
alias gwce='./gradlew cleanEclipse'
alias gwe='./gradlew eclipse'
alias gwcee='./gradlew cleanEclipse eclipse'

## Maven
alias create-nifi-processor='mvn archetype:generate -DarchetypeGroupId=org.apache.nifi -DarchetypeArtifactId=nifi-processor-bundle-archetype -DarchetypeVersion=1.9.2 -DnifiVersion=1.9.2'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

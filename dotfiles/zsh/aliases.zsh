# General
alias src='source $HOME/.zshrc'
alias getip='curl -s https://checkip.amazonaws.com | pbcopy'
alias getlocalip="ifconfig | grep 'inet 192' | awk '{print $2}' | pbcopy"
alias vi='nvim'
alias vim='nvim'
alias zim='nvim $HOME/.zshrc'
alias dim='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/zsh/zshrc'
alias dima='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/zsh/aliases.zsh'
alias dime='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/zsh/exports.zsh'
alias dimf='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/zsh/functions.zsh'
alias dimp='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/zsh/plugins.zsh'
alias dimm='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/zsh/misc.zsh'
alias nim='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/init.vim'
alias nims='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/settings.vim'
alias nimp='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plugins.vim'
alias nimm='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/plug-config/whichkey.vim $XDG_CONFIG_HOME/dotfiles/nvim/mappings.vim'
alias nimt='nvim $XDG_CONFIG_HOME/dotfiles/dotfiles/nvim/themes.vim'
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias vsc-keyrepeat='defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false'
alias genpw='openssl rand -base64 12 | pbcopy'
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'

# Git
alias gcona='git config user.name "Joshua Ward" ; git config user.email "j2udevelopment@gmail.com"'
alias gconu='git config --unset user.name ; git config --unset user.email'
alias gconl='git config -l'
alias gconc='git config --global credential.helper cache'
alias gconcu='git config --global --unset credential.helper'
alias lzg='lazygit'

# LSD
## Obviously don't use these if not using lsd :)
alias ls='lsd'
alias l='ls -lah'
alias lt='ls --tree'
alias lta='ls -a --tree'

# Java
alias ejava8='export JAVA_HOME=$JAVA_8_HOME'
alias ejava11='export JAVA_HOME=$JAVA_11_HOME'
alias java8='/Library/Java/JavaVirtualMachines/jdk1.8.0_331.jdk/Contents/Home/bin/java'

# Golang
alias gorm='go run main.go'

# Python
alias pip='pip3'
alias ivenv='python3 -m venv .venv && . .venv/bin/activate && python3 -m pip install --upgrade pip'
alias vac='. .venv/bin/activate'

# Minikube
alias mk='minikube'
alias mks='minikube service'
alias mkdd='eval $(minikube docker-env)'
alias mkddu='eval $(minikube docker-env -u)'

# Kubernetes
alias kdf='kubectl delete -f'
alias wkgp='watch kubectl get pods -A'
alias kgpw='kubectl get pods -A -w'
alias kgpa='kubectl get pods -A'
alias kgsa='kubectl get service -A'
alias kgda='kubectl get deployment -A'
alias kgvsa='kubectl get virtualservice -A'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kdvs='kubectl describe vs'
alias ke='kubectl edit'
alias krr='kubectl rollout restart deployment'
alias netshoot='kubectl run --rm networking-shell -i --tty --image nicolaka/netshoot -- /bin/bash'
alias krmevictions='kubectl get pods -A | grep Evicted | awk '{print \$2}' | xargs -L1 kubectl delete pods'
alias ktx='kubectx'
alias kns='kubens'

# Helm
alias hi='helm install'
alias hin='helm install -n'
alias hu='helm upgrade -i'
alias hun='helm upgrade -i -n'
alias hd='helm delete'
alias hdn='helm delete -n'
alias hh='helm history'
alias hhn='helm history -n'
alias hls='helm ls'
alias hlsn='helm ls -n'
alias hlsa='helm ls -A'
alias hrls='helm repo list'
alias hsr='helm search repo'

# Skaffold
alias sr='skaffold run'
alias srp='skaffold run -p'
alias sd='skaffold delete'
alias sdp='skaffold delete -p'
alias sdb='skaffold debug --port-forward'
alias sb='skaffold build'

# Docker
alias doc='docker'
alias dk='docker kill'
alias dkall='docker kill $(docker ps -aq)'
alias drm='docker rm'
alias drmf='docker rm -f'
alias drmi='docker rmi -f'
alias drmall='docker rm $(docker ps -aq)'
alias drmid='docker rmi $(docker images -f 'dangling=true' -q)'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dn='docker network'
alias dnls='docker network ls'
alias dsp='docker system prune'
alias dspa='docker system prune -a'
alias dstart='docker start -ai'
alias lzd='lazydocker'

# Terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfwl='terraform workspace list'
alias tfws='terraform workspace select'
alias tfo='terraform output'

# Terragrunt
alias tg='terragrunt'
alias tgi='terragrunt init'
alias tgp='terragrunt plan'
alias tga='terragrunt apply'

# Ansible
alias an='ansible'
alias ap='ansible-playbook'
alias ag='ansible-galaxy'
alias av='ansible-vault'

# Yarn
alias ygl='cat `yarn global dir`/package.json'

# Gradle
alias gw='./gradlew'
alias gwa='./gradlew assemble'
alias gwc='./gradlew clean'
alias gwb='./gradlew build'
alias gwcb='./gradlew clean build'
alias gwcbp='./gradlew clean build publish'
alias gwpml='./gradlew publishToMavenLocal'
alias gwce='./gradlew cleanEclipse'
alias gwe='./gradlew eclipse'
alias gwcee='./gradlew cleanEclipse eclipse'
alias kill-daemons='jps | grep GradleDaemon | grep -Eo '^\d+' | xargs kill -9'
alias gradle-unlock='find ~/.gradle -type f -name "*.lock" -delete'

# NiFi
alias create-nifi-processor='mvn archetype:generate -DarchetypeGroupId=org.apache.nifi -DarchetypeArtifactId=nifi-processor-bundle-archetype -DarchetypeVersion=1.9.2 -DnifiVersion=1.9.2'

# Hugo
alias hs='hugo serve'

# Vagrant
alias v='vagrant'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant suspend'
alias vr='vagrant resume'
alias vd='vagrant destroy'
alias vrl='vagrant reload'
alias vp='vagrant provision'
alias vssh='vagrant ssh'

# Homebrew
alias hbv='cd $(brew --repo) && git checkout tags/2.4.16 && cd -'

# Recording
alias arec='asciinema rec'
alias aplay='asciinema play'

# Hex Code Util
alias hexs='xxd -psd'

# Zarf
alias ztcc='zarf tools clear-cache'
alias zpc='ztcc && zarf package create'
alias zpd='ztcc && zarf package deploy'

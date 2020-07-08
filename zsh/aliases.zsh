# General
alias src='source $HOME/.zshrc'
alias zim='vim $HOME/.zshrc'
alias dim='vim $HOME/dotfiles/zsh/.zshrc'
alias dima='vim $HOME/dotfiles/zsh/aliases.zsh'
alias dime='vim $HOME/dotfiles/zsh/exports.zsh'
alias dimf='vim $HOME/dotfiles/zsh/functions.zsh'
alias dimp='vim $HOME/dotfiles/zsh/plugins.zsh'
alias nim='vim $HOME/.config/nvim/init.vim'
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Java
alias java8='export JAVA_HOME=$JAVA_8_HOME; java -version'
alias java11='export JAVA_HOME=$JAVA_11_HOME; java --version'
alias java13='export JAVA_HOME=$JAVA_13_HOME; java --version'

# Minikube
alias mk='minikube'
alias mks='minikube service'
alias mkdd='eval $(minikube docker-env)'
alias mkddu='eval $(minikube docker-env -u)'

# Kubernetes
alias wkgp='watch kubectl get pods -A'
alias kgpw='kubectl get pods -A -w'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ke='kubectl edit'
alias netshoot='kubectl run --rm --generator=run-pod/v1 networking-shell -i --tty --image nicolaka/netshoot -- /bin/bash'
alias krmevictions='kubectl get pods -A | grep Evicted | awk '{print \$2}' | xargs -L1 kubectl delete pods'

# Docker
alias doc='docker'
alias dk='docker kill'
alias dkall='docker kill $(docker ps -aq)'
alias drm='docker rm'
alias drmi='docker rmi -f'
alias drmall='docker rm $(docker ps -aq)'
alias drmid='docker rmi $(docker images -f 'dangling=true' -q)'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -aq'
alias dn='docker network'
alias dnls='docker network ls'

# Terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfwl='terraform workspace list'
alias tfws='terraform workspace select'

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

# Maven
alias create-nifi-processor='mvn archetype:generate -DarchetypeGroupId=org.apache.nifi -DarchetypeArtifactId=nifi-processor-bundle-archetype -DarchetypeVersion=1.9.2 -DnifiVersion=1.9.2'

# Recording
alias arec='asciinema rec'
alias aplay='asciinema play'
alias trec='termtosvg -t ~/dotfiles/terminal-recorders/termtosvg/p10k-template.svg'

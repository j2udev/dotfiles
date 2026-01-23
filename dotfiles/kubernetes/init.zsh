# kubernetes aliases
alias k='kubectl'
alias kdf='kubectl delete -f'
alias kaf='kubectl apply -f'
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
alias netshoot='kubectl run --rm networking-shell -i --tty --image nicolaka/netshoot -- /bin/zsh'
alias krmevictions='kubectl get pods -A | grep Evicted | awk "{print \$2}" | xargs -L1 kubectl delete pods'

# kubectx/kubens
if command -v kubectx &> /dev/null; then
    alias ktx='kubectx'
fi
if command -v kubens &> /dev/null; then
    alias kns='kubens'
fi

# helm
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

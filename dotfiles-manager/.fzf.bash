# Setup fzf
# ---------
if [[ ! "$PATH" == */home/docker/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/docker/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/docker/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/docker/.fzf/shell/key-bindings.bash"

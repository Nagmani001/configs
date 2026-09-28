# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nagmani/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/nagmani/.fzf/bin"
fi

source <(fzf --zsh)

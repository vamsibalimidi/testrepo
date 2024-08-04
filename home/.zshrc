. "$HOME/.cargo/env"
. ~/.alias.bash

eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jandedobbeleer.omp.json)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

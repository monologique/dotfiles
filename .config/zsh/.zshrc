bindkey -e

setopt AUTO_CD
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

HISTFILE=$XDG_DATA_HOME/zsh/zsh_history
SAVEHIST=1000
HISTSIZE=$(( $SAVEHIST + 1 ))

# Compinit

autoload -Uz compinit bashcompinit
compinit
bashcompinit

# Plugins


if [[ -e $ZSH_PLUGIN_HOME/dune-completion/bash.sh ]]; then
    source $ZSH_PLUGIN_HOME/dune-completion/bash.sh
fi

if [[ -e $ZSH_PLUGIN_HOME/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
    source $ZSH_PLUGIN_HOME/zsh-history-substring-search/zsh-history-substring-search.zsh
    
    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down
    
    HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=black,bg=yellow"
    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=black,bg=red"
fi

if [[ $(command -v fzf) >/dev/null ]]; then
    source <(fzf --zsh)
fi

######
# GO #
######

export GOPATH=$XDG_CACHE_HOME/go

#########
# OCAML #
#########

# opam
export OPAMROOT=$XDG_CACHE_HOME/opam
if [[ -r $OPAMROOT/opam-init/init.sh ]]; then
    . $OPAMROOT/opam-init/init.zsh >/dev/null 2>/dev/null || true
fi

#########
# PROMP #
#########

eval "$(starship init zsh)"

######################
# ALIASES AND HASHES #
######################

alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

alias gs="git status"
alias gl="git log --oneline"

hash -d repos="$HOME/Repositories"
hash -d dots="$HOME/Repositories/dotfiles/"

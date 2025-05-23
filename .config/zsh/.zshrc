if [[ -x /opt/homebrew/bin/brew ]]; then
	export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

autoload -Uz compinit
compinit

# --- [[ OCaml ]] ---
if [[ $(command -v pyenv) >/dev/null ]]; then
	export OPAMROOT=$XDG_CACHE_HOME/opam
	alias init_opam="eval $(opam env)"
fi


# --- [[ Python ]] ---
if [[ $(command -v pyenv) >/dev/null ]]; then
	export PYENV_ROOT=$XDG_CACHE_HOME/pyenv
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	alias init_pyenv="$(pyenv init - zsh)"
fi

# --- [[ Theming ]] ---
autoload -U promptinit; promptinit
prompt typewritten

# --- [[ Aliases ]] ---
alias ls="ls -G"
alias ll="ls -l"
alias la="ls -la"

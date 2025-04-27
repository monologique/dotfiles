# ─── ZSH  ────────────────────────────────────────────────────────────────
if [ -r "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
  source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

if [ -x "$(which fzf)" ]; then
  source <(fzf --zsh)
fi

autoload -Uz compinit
compinit

# ─── Tmux ────────────────────────────────────────────────────────────────────

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# ─── Hammerspoon ──────────────────────────────────────────────────────────

if [ -e "/Applications/Hammerspoon.app" ] || [ -e "$HOME/Applications/Hammerspoon.app" ]; then
  if ! defaults read org.hammerspoon.Hammerspoon MJConfigFile &>/dev/null; then
    defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
  fi
fi

# ─── Languages ───────────────────────────────────────────────────────────────

# |> OCaml
export OPAMROOT="$XDG_CACHE_HOME/opam"
if [ -f "$OPAMROOT/opam-init/init.zsh" ]; then
  source "$OPAMROOT/opam-init/init.zsh"
fi

# |> Python
export PYENV_ROOT="$XDG_CACHE_HOME/pyenv"
if command -v pyenv >/dev/null 2>&1; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# |> Rust
export RUSTUP_HOME="$XDG_CACHE_HOME/rustup"
export CARGO_HOME="$XDG_CACHE_HOME/cargo"

if [ -r "$CARGO_HOME/env" ]; then
  source "$CARGO_HOME/env"
fi


# ─── Prompt ─────────────────────────────────────────────────────────────────

eval "$(starship init zsh)"

# ─── Aliases ─────────────────────────────────────────────────────────────────

alias dot="git --git-dir=$REPOS/dotfiles/ --work-tree=$HOME"
alias dotg="lazygit --git-dir=$REPOS/dotfiles/ --work-tree=$HOME"

alias vi="$EDITOR"
alias vim="$EDITOR"

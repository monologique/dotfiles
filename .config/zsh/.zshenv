# ─── Homebrew ────────────────────────────────────────────────────────────────

if [ -x /opt/homebrew/bin/brew ]; then
  export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ─── General ───────────────────────────────────────────────────────────────-

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/Library/Caches"
export XDG_DATA_HOME="$HOME/.local/share"
export REPOS="$HOME/Repositories"
export EDITOR="hx"

# Disable Apple implementation
SHELL_SESSIONS_DISABLE=1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/Library/Caches
export XDG_DATA_HOME=$HOME/.local/share
export ZSH_PLUGIN_HOME=$XDG_CONFIG_HOME/zsh/plugins

# Zsh
! test -d $XDG_DATA_HOME/zsh && mkdir -p $XDG_DATA_HOME/zsh

# Brew
if [[ -e /opt/homebrew/bin/brew ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
    export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/homebrew/Brewfile
fi

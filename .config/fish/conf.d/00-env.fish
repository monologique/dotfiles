switch (uname -s)
    case Darwin
        set -Ux XDG_CACHE_HOME $HOME/Library/Caches
        set -Ux XDG_CONFIG_HOME $HOME/.config

        source "$XDG_CONFIG_HOME/fish/conf.d/$(uname -s | string lower).fish"
    case '*'

        set -Ux XDG_CACHE_HOME $HOME/.cache
end

set fish_greeting ""

set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/Library/Caches
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux EDITOR hx

# [ NIX ] #
if test -r /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish

    set -p fish_complete_path /nix/var/nix/profiles/default/share/fish/vendor_completions.d/

    set -Ux NIX_PROFILE_HOME $HOME/.nix-profile

    if test -d $NIX_PROFILE_HOME/share/fish/completions
        set -p fish_complete_path $NIX_PROFILE_HOME/share/fish/completions/
    end
end

# [ HOMEBREW ]

if test -x /opt/homebrew/bin/brew
    set -Ux HOMEBREW_BUNDLE_FILE $XDG_CONFIG_HOME/homebrew/Brewfile
    eval (/opt/homebrew/bin/brew shellenv) | source

    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    if test -d (brew --prefix)/share/fish/vendor_functions.d
        set -U fish_function_path $fish_function_path (brew --prefix)/share/fish/vendor_functions.d
    end
end

# [TMUX] #
if ! test -e ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
end

# [MACOS SETTINGS ] #

if test -e /Applications/Hammerspoon.app; or test -e ~/Applications/Hammerspoon.app
    if ! defaults read org.hammerspoon.Hammerspoon MJConfigFile &>/dev/null
        defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
    end
end

# [ LANGUAGES ] #

# |> OCaml
set -Ux OPAMROOT $XDG_CACHE_HOME/opam
if test -d $OPAMROOT/opam-init/init.fish
    . $OPAMROOT/opam-init/init.fish
end

# |> Python
set -Ux PYENV_ROOT $XDG_CACHE_HOME/pyenv
if command -q pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - fish | source
end

# |> Rust
# Sets the envars before for the shell script installer
set -Ux RUSTUP_HOME $XDG_CACHE_HOME/rustup
set -Ux CARGO_HOME $XDG_CACHE_HOME/cargo

if test -r $CARGO_HOME/env.fish
    source $CARGO_HOME/env.fish
end

# |> Aliases
set -Ux repos $HOME/Repositories
alias dot="$(which git) --git-dir=$repos/dotfiles/ --work-tree=$HOME"

fish_add_path --append --path $HOME/Applications/Emacs.app/Contents/MacOS/bin

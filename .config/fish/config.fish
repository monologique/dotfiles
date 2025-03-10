set -U fish_greeting

# Direnv
if command -v direnv >/dev/null && command -v git >/dev/null
    ! test -d $XDG_CACHE_HOME/nix-direnv && git clone --depth=1 https://github.com/nix-community/nix-direnv $XDG_CACHE_HOME/nix-direnv >/dev/null
    direnv hook fish | source
end

# Go
set -Ux GOPATH $XDG_CACHE_HOME/go

# Named directories
set -Ux repo $HOME/Repositories
set -Ux dot $repo/dotfiles

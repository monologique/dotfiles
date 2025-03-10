set -Ux NIX_DEFAULT_PROFILE_HOME /nix/var/nix/profiles/default

if test -e "$NIX_DEFAULT_PROFILE_HOME/etc/profile.d/nix-daemon.fish"
    . $NIX_DEFAULT_PROFILE_HOME/etc/profile.d/nix-daemon.fish
    source $NIX_DEFAULT_PROFILE_HOME/share/fish/vendor_completions.d/nix.fish
else
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    . $NIX_DEFAULT_PROFILE_HOME/etc/profile.d/nix-daemon.fish
    source $NIX_DEFAULT_PROFILE_HOME/share/fish/vendor_completions.d/nix.fish
end

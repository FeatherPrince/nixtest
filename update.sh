#refresh and install files based on the flake
sudo nixos-rebuild switch --flake "$(dirname "$0")" --impure
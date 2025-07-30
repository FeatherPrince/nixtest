#update flake witha new timestamp and rebuild the system based on the new timestamp
sudo nix flake update --flake "$(dirname "$0")" && sudo nixos-rebuild switch --flake "$(dirname "$0")" --impure && nix-store -q --references /var/run/current-system/sw | cut -d'-' -f2- > currentlyInstalledPackages

#todo: fix the flake part of the script so it's possible to run it from any directory


#echo "$(dirname "$0")/flake.nix"
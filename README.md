# dotfiles

My NixOS configuration files. Don't look yet, they are not ready and I'm still learning :D

```bash
# Rebuild NixOS system
nixos-rebuild switch --flake ~/dotfiles

# Remove all previous NixOS versions (also from boot menu)
nix-collect-garbage -d
nixos-rebuild switch
```

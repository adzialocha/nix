# dotfiles

My NixOS system configuration files.

> Don't look yet, they are not ready and I'm still learning :D

```bash
# Clone repository into hidden folder
git clone git@github.com:adzialocha/dotfiles.git .dotfiles

# Rebuild NixOS system
nixos-rebuild switch --flake ~/.dotfiles

# Remove all previous NixOS versions (run nixos-rebuild afterwards)
nix-collect-garbage -d

# Format .nix files
nixfmt **/*.nix

# Set alias for templates folder
nix registry add templates ~/.dotfiles/templates

# Set up a Rust project with template (example)
nix flake init -t templates#rust
```

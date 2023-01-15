{ config, pkgs, ... }:

{
  imports = [ ../home.nix ];

  # @TODO: This is not working
  services = {
    screen-locker = {
      enable = true;
      lockCmd = "dm-tool lock";
      xautolock = { enable = true; };
    };
  };
}

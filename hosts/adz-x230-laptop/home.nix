{ config, pkgs, ... }:

{
  imports = [ ../home ];

  # @TODO: This is not working
  services = {
    screen-locker = {
      enable = true;
      lockCmd = "dm-tool lock";
      xautolock = { enable = true; };
    };
  };
}

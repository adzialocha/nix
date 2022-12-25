{ config, lib, pkgs, ... }:

let cfg = config.modules.i3lock;
in {
  options.modules.i3lock.enable = lib.mkEnableOption "i3lock";

  config = lib.mkIf cfg.enable {
    home = { packages = with pkgs; [ i3lock ]; };

    services = {
      screen-locker = {
        enable = true;
        lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 000000";
      };
    };
  };
}

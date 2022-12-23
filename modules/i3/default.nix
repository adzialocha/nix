{ config, lib, pkgs, ... }:

let cfg = config.modules.i3;

in {
  options.modules.i3 = {
    enable = lib.mkEnableOption "i3";
  };

  config = lib.mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;
    };
  };
}

{ config, lib, pkgs, ... }:

let cfg = config.modules.x11;
in {
  options.modules.x11.enable = lib.mkEnableOption "x11";

  config = lib.mkIf cfg.enable {
    home.file.".Xresources".source = ./.Xresources;
  };
}

{ config, lib, pkgs, ... }:

let cfg = config.modules.rofi;
in {
  options.modules.rofi.enable = lib.mkEnableOption "rofi";

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      cycle = true;
      terminal = "${lib.getExe pkgs.alacritty}";
      font = "IBM Plex Mono 11";
      theme = ./theme.rasi;
      extraConfig = {
        modi = "combi";
        combi-modi = "window,run,ssh";
      };
    };
  };
}

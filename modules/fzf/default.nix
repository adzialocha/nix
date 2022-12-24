{ config, lib, pkgs, ... }:

let cfg = config.modules.fzf;
in {
  options.modules.fzf.enable = lib.mkEnableOption "fzf";

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
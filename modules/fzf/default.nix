{ config, lib, pkgs, ... }:

let cfg = config.modules.fzf;
in {
  options.modules.fzf.enable = lib.mkEnableOption "fzf";

  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type f --hidden --follow --exclude .git";
      defaultOptions = [
        "--preview cat {}"
      ];
      fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
    };
  };
}

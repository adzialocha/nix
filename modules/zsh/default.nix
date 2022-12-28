{ config, lib, pkgs, ... }:

let cfg = config.modules.zsh;
in {
  options.modules.zsh.enable = lib.mkEnableOption "zsh";

  config = lib.mkIf cfg.enable {
    home.file.".oh-my-zsh/custom/themes/adz-prompt.zsh-theme".source =
      config.lib.file.mkOutOfStoreSymlink ./adz-prompt.zsh-theme;

    programs.zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "cp" "git" ];
        custom = "$HOME/.oh-my-zsh/custom";
        theme = "adz-prompt";
      };

      shellGlobalAliases = {
        vim = "nvim";
        Ag = "ag";

        l = "ls -lah --group-directories-first";
        la = "ls -lAhv --group-directories-first";
        ll = "ls -lh --group-directories-first";

        # Move `wget` HSTS file out of home directory
        wget = "wget --hsts-file ${config.xdg.dataHome}/.wget-hsts";
      };

      # Move zsh history out of home directory
      history = { path = "${config.xdg.dataHome}/zsh/.zsh-history"; };

      # Move .zcomp files out of home directory
      initExtraFirst = ''
        export ZDOTDIR="${config.xdg.dataHome}/zsh"
      '';

      # Move `less` history and node repl files out of home directory
      initExtra = ''
        export LESSHISTFILE="${config.xdg.dataHome}/.lesshst"
        export NODE_REPL_HISTORY="${config.xdg.dataHome}/.node_repl_history"
      '';
    };
  };
}

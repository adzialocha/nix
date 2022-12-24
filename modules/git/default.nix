{ config, lib, pkgs, ... }:

let cfg = config.modules.git;
in {
  options.modules.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Andreas Dzialocha";
      userEmail = "x12@adz.garden";
      extraConfig = {
        core.autocrlf = "input";
        init.defaultBranch = "main";
        apply.whitespace = "fix";
        push.default = "simple";
        pull.rebase = true;
        merge.log = true;
        log.abbrevcommit = true;
      };
    };
  };
}

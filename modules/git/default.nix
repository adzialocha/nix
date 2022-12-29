{ config, lib, pkgs, ... }:

let cfg = config.modules.git;
in {
  options.modules.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf cfg.enable {
    home.file.".gitignore-global".source =
      config.lib.file.mkOutOfStoreSymlink ./.gitignore-global;

    programs.git = {
      enable = true;

      userName = "Andreas Dzialocha";
      userEmail = "x12@adz.garden";

      extraConfig = {
        core = {
          autocrlf = "input";
          whitespace = "fix,space-before-tab,tab-in-indent,trailing-space";
          excludesfile = "$HOME/.gitignore-global";
        };
        init = { defaultBranch = "main"; };
        apply = { whitespace = "fix"; };
        advice = { addIgnoredFile = false; };
        color = { ui = "auto"; };
        "color \"branch\"" = {
          current = "yellow reverse";
          local = "yellow";
          remote = "green";
        };
        "color \"diff\"" = {
          meta = "magenta";
          frag = "magenta bold";
          old = "red";
          new = "green";
        };
        "color \"status\"" = {
          added = "yellow";
          changed = "green";
          untracked = "red";
        };
        push = { default = "simple"; };
        pull = { rebase = true; };
        merge = { log = true; };
        log = { abbrevcommit = true; };
      };
    };
  };
}

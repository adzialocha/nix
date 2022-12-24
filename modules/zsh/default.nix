{ config, lib, pkgs, ... }:

let cfg = config.modules.zsh;
in {
  options.modules.zsh.enable = lib.mkEnableOption "zsh";

  config = lib.mkIf cfg.enable {
    home.file.".oh-my-zsh/custom/themes/adz-prompt.zsh-theme".source = config.lib.file.mkOutOfStoreSymlink ./adz-prompt.zsh-theme;

    programs.zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
	plugins = [ "cp" "git" ];
	custom = "$HOME/.oh-my-zsh/custom";
	theme = "adz-prompt";
      };

      shellGlobalAliases = {
	l = "ls -lah --group-directories-first";
	la = "ls -lAhv --group-directories-first";
	ll = "ls -lh --group-directories-first";
	vim = "nvim";
        Ag = "ag";
      };
    };
  };
}

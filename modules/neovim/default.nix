{ config, lib, pkgs, ... }:

let cfg = config.modules.neovim;
in {
  options.modules.neovim.enable = lib.mkEnableOption "neovim";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      neovim
      xclip
    ];
  };
}

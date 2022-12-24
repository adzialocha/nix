{ config, pkgs, ... }:

{
  imports = [ ./modules ];

  xsession.enable = true;

  home = {
    username = "adz";
    homeDirectory = "/home/adz";
    stateVersion = "22.11";

    sessionVariables = rec {
      EDITOR = "nvim";
      VISUAL = EDITOR;
    };

    packages = with pkgs; [
      element-desktop
      firefox
      signal-desktop
      tdesktop
      thunderbird

      curl
      ffmpeg
      htop
      jq
      openssl
      tree
      unzip
      wget
    ];
  };

  programs = { home-manager.enable = true; };

  modules = {
    alacritty.enable = true;
    git.enable = true;
    i3.enable = true;
    neovim.enable = true;
    zsh.enable = true;
  };

}

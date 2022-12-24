{ config, pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  xsession.enable = true;

  fonts.fontconfig.enable = true;

  home = {
    username = "adz";
    homeDirectory = "/home/adz";

    sessionVariables = rec {
      EDITOR = "nvim";
      VISUAL = EDITOR;
    };

    packages = with pkgs; [
      firefox
      thunderbird

      curl
      htop
      openssl
      tree
      unzip
      wget

      ibm-plex
      noto-fonts
      noto-fonts-emoji
    ];

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };

  modules = {
    alacritty.enable = true;
    fzf.enable = true;
    git.enable = true;
    i3.enable = true;
    i3status.enable = true;
    neovim.enable = true;
    rofi.enable = true;
    x11.enable = true;
    zsh.enable = true;
  };
}

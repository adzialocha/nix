{ config, pkgs, ... }:

{
  imports = [ ../../modules ];

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
      # Desktop applications
      firefox
      signal-desktop
      tdesktop
      thunderbird

      # Useful tools and system libraries
      cacert
      curl
      dnsutils
      fd
      file
      gcc
      htop
      jq
      man-pages
      nixfmt
      openssl
      scrot
      silver-searcher
      tree
      unzip
      wget
      xclip

      # Fonts
      ibm-plex
      noto-fonts
      noto-fonts-emoji
      roboto-mono
      source-code-pro
    ];

    stateVersion = "22.11";
  };

  programs = { home-manager.enable = true; };

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

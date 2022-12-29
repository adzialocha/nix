{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = { loader.systemd-boot.enable = true; };

  networking = {
    hostName = "adz-x230-laptop";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.utf8";
      LC_IDENTIFICATION = "de_DE.utf8";
      LC_MEASUREMENT = "de_DE.utf8";
      LC_MONETARY = "de_DE.utf8";
      LC_NAME = "de_DE.utf8";
      LC_NUMERIC = "de_DE.utf8";
      LC_PAPER = "de_DE.utf8";
      LC_TELEPHONE = "de_DE.utf8";
      LC_TIME = "de_DE.utf8";
    };
  };

  sound = { enable = true; };

  console = { enable = true; };

  # Disable bluetooth
  hardware.bluetooth.enable = false;
  boot.blacklistedKernelModules = [ "bluetooth" "btusb" ];

  services = {
    xserver = {
      enable = true;
      layout = "eu";
      displayManager = {
        # This session is just a placeholder, we let the home manager handle
        # everything for us instead
        session = [{
          manage = "window";
          name = "placeholder";
          start = "";
        }];
        defaultSession = "none+placeholder";
        lightdm = {
          enable = true;
          background = "#000000";
          greeters.mini = {
            enable = true;
            user = "adz";
            extraConfig = ''
              [greeter]
              password-input-width = 30
              show-password-label = true
              [greeter-theme]
              background-color = "#000000"
              border-color = "#000000"
              error-color = "#000000"
              font = "IBM Plex Mono"
              font-size = "16px"
              font-weight = "normal"
              password-background-color = "#ffffff"
              password-border-color = "#ffffff"
              password-color = "#000000"
              text-color = "#000000"
              window-color = "#ffffff"
            '';
          };
        };
      };
      excludePackages = with pkgs; [ xterm ];
    };
  };

  users.users.adz = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment = { systemPackages = with pkgs; [ ]; };

  # This value determines the NixOS release from which the default settings for
  # stateful data, like file locations and database versions on your system
  # were taken. It‘s perfectly fine and recommended to leave this value at the
  # release version of the first install of this system. Before changing this
  # value read the documentation for this option (e.g. man configuration.nix or
  # on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}

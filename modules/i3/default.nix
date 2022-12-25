{ config, lib, pkgs, ... }:

let
  cfg = config.modules.i3;
  mod = "Mod1";
in {
  options.modules.i3 = { enable = lib.mkEnableOption "i3"; };

  config = lib.mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;

      config = {
        modifier = mod;

        fonts = {
          names = [ "IBM Plex Mono" ];
          size = 12.5;
        };

        colors = {
          background = "#2d2d2d";
          focused = {
            background = "#2d2d2d";
            border = "#1e1e1e";
            childBorder = "#2d2d2d";
            indicator = "#2d2d2d";
            text = "#d3c0c8";
          };
          focusedInactive = {
            background = "#2d2d2d";
            border = "#1e1e1e";
            childBorder = "#2d2d2d";
            indicator = "#2d2d2d";
            text = "#747369";
          };
          unfocused = {
            background = "#2d2d2d";
            border = "#1e1e1e";
            childBorder = "#2d2d2d";
            indicator = "#2d2d2d";
            text = "#747369";
          };
          urgent = {
            background = "#f2777a";
            border = "#1e1e1e";
            childBorder = "#2d2d2d";
            indicator = "#f2777a";
            text = "#2d2d2d";
          };
          placeholder = {
            background = "#2d2d2d";
            border = "#1e1e1e";
            childBorder = "#2d2d2d";
            indicator = "#292d2e";
            text = "#747369";
          };
        };

        window = {
          titlebar = false;
          border = 1;
          hideEdgeBorders = "both";
        };

        floating = {
          titlebar = true;
          border = 1;
          # To find out the criteria for a window we can make use of the
          # "wmutil" core tools: https://github.com/wmutils/core. These tools
          # will help us to find out the window id. With that id we can use
          # "xprop" to get the criteria of that regarding window.
          criteria = [ ];
        };

        defaultWorkspace = "workspace number 1";
        startup = [{ command = "${lib.getExe pkgs.alacritty}"; }];

        keybindings = lib.mkOptionDefault {
          # Launch process
          "${mod}+Return" = "exec ${lib.getExe pkgs.alacritty}";
          "${mod}+space" = "exec ${lib.getExe pkgs.rofi} -show run";

          # Switch process
          "${mod}+Tab" = "exec ${lib.getExe pkgs.rofi} -show window";

          # Move
          "${mod}+h" = "move left";
          "${mod}+j" = "move down";
          "${mod}+k" = "move up";
          "${mod}+l" = "move right";

          # Show floating windows with title
          "${mod}+Shift+space" =
            "floating toggle; [tiling con_id=__focused__] border none [floating con_id=__focused__] border normal; resize set 600 400; move position center";

          # Take a screenshot
          "F12" = "exec ${
              lib.getExe pkgs.scrot
            } --quality 90 ~/downloads/screenshot-%Y-%m-%dT%H:%M:%S.jpg";
        };

        bars = [{
          position = "bottom";
          statusCommand = "${pkgs.i3status}/bin/i3status";
          workspaceButtons = false;
          fonts = {
            names = [ "IBM Plex Mono" ];
            size = 12.5;
          };
          colors = {
            background = "#000000";
            statusline = "#FFFFFF";
            separator = "#000000";
          };
        }];
      };
    };
  };
}

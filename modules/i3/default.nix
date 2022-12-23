{ config, lib, pkgs, ... }:

let 
  cfg = config.modules.i3;
  mod = "Mod1";
in {
  options.modules.i3 = {
    enable = lib.mkEnableOption "i3";
  };

  config = lib.mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;

      config = {
      	modifier = mod;

	fonts = {
	  names = [ "IBM Plex Mono" ];
	  size = 10.0;
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
	};

	menu = "${lib.getExe pkgs.rofi}";

	startup = [
	  {
	    command = "${lib.getExe pkgs.alacritty}";
	  }
	];

	keybindings = lib.mkOptionDefault {
	  # Launch process
	  "${mod}+Return" = "exec ${lib.getExe pkgs.alacritty}";
	  "${mod}+Space" = "exec ${lib.getExe pkgs.rofi} -show run";

	  # Switch process
	  "${mod}+Tab" = "exec ${lib.getExe pkgs.rofi} -show window";

	  # Move
          "${mod}+h" = "move left";
          "${mod}+j" = "move down";
          "${mod}+k" = "move up";
          "${mod}+l" = "move right";
	};

	bars = [
	  {
	    position = "bottom";
	    workspaceButtons = false;
	    colors = {
	      background = "#000000";
	    };
	  }
	];
      };
    };
  };
}

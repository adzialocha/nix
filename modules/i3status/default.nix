{ config, lib, pkgs, ... }:

let cfg = config.modules.i3status;
in {
  options.modules.i3status.enable = lib.mkEnableOption "i3status";

  config = lib.mkIf cfg.enable {
    programs.i3status = {
      enable = true;

      general = {
        colors = true;
	color_good = "#FFFFFF";
	color_degraded = "#FFFFFF";
	color_bad = "#F2777A";
	interval = 5;
      };

      modules = {
        "wireless _first_": {
	  position = 1;
	  settings = {
	    format_up = "%quality %ip";
	    format_down = "";
	  };
	};

        "tztime local": {
	  position = 2;
	  settings = {
	    format = "%d.%m. %H:%M ";
	  };
	};
      };
    };
  };
}

{ config, lib, pkgs, ... }:

let cfg = config.modules.i3status;
in {
  options.modules.i3status.enable = lib.mkEnableOption "i3status";

  config = lib.mkIf cfg.enable {
    programs.i3status-rust = {
      enable = true;

      bars = {
        bottom = {
          blocks = [
            {
              block = "net";
              format = "{signal_strength} {ip}";
            }
            {
              block = "time";
              format = "%d.%m. %H:%M";
            }
          ];
	};
      };
    };
  };
}

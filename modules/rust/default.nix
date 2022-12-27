{ config, lib, pkgs, ... }:

let cfg = config.modules.rust;
in {
  options.modules.rust.enable = lib.mkEnableOption "rust";

  config = lib.mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        rustup
        rust-analyzer
      ];
    }
  };
}

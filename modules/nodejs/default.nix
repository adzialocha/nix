{ config, lib, pkgs, ... }:

let cfg = config.modules.nodejs;
in {
  options.modules.nodejs.enable = lib.mkEnableOption "nodejs";

  config =
    lib.mkIf cfg.enable { home = { packages = with pkgs; [ nodejs ]; }; };
}

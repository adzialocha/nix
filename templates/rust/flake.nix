{
  description = "Rust Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      follows = "nixpkgs";
    };
    utils = {
      url = "github:numtide/flake-utils";
      follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, rust-overlay, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import rust-overlay) ];
        };
      in {
        devShells = mkShell {
          buildInputs = with pkgs; [ openssl rust-bin.stable.latest.default ];
          shellHook = "";
        };
      });
}

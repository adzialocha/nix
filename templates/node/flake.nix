{
  description = "NodeJS Project";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    language-servers.url = "git+https://git.sr.ht/~bwolf/language-servers.nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
  };

  outputs = { self, nixpkgs, language-servers, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs-19_x
            pkgs.nodePackages.npm
            pkgs.nodePackages.npm-check-updates
            language-servers.packages.${system}.typescript-language-server
            language-servers.packages.${system}.vscode-eslint-language-server
          ];
          shellHook = "";
        };
      });
}

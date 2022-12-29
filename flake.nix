# This is a Nix Flake file. It helps us with defining Nix package dependencies
# we need to pull in first to be able to setup our system.

{
  description = "My system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }: {
    # Pull in our own flake templates
    templates = import ./templates;

    # Set up NixOS with home-mananger for each machine
    nixosConfigurations.adz-x230-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/adz-x230-laptop/configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-x230
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = false;
            users.adz = import ./hosts/adz-x230-laptop/home.nix;
          };
        }
      ];
    };
  };
}

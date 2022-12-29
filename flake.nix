{
  description = "My system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = { url = "github:NixOS/nixos-hardware/master"; };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }: {
    nixosConfigurations = {
      adz-x230-laptop = nixpkgs.lib.nixosSystem {
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

      adz-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/adz-desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = false;
              users.adz = import ./hosts/adz-desktop/home.nix;
            };
          }
        ];
      };
    };
  };
}

{
  description = "Distcc cluster distrobution";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
  };

  disko = {
    url = "github:nix-community/disko";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    {
      nixosConfigurations = {

        distcc = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            inputs.disko.nixosModules.default
            (import ./disko.nix { device = "/dev/sda"; })
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  description = "NixOS live system for Nvidia tests";

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
      let
        inherit (self) outputs;
      in
      {
        nixosConfigurations.nvidiaIso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };
}

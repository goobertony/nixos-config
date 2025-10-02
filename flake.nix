{
  description = "
                            __   __      ___                 ___
    |\/| \ /    |\ | | \_/ /  \ /__`    |__  |     /\  |__/ |__
    |  |  |     | \| | / \ \__/ .__/    |    |___ /~~\ |  \ |___
  ";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    musnix  = { url = "github:musnix/musnix"; };
  };
  outputs = { self, nixpkgs, musnix, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit nixpkgs musnix; };
          modules = [ musnix.nixosModules.musnix ./configuration.nix ];
        };
      };
    };
}

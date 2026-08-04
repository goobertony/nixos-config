{
  description = "goober_tonii";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    musnix = {
      url = "github:musnix/musnix";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      musnix,
      chaotic,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.nixos = lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit
            inputs
            nixpkgs
            musnix
            ;
          pkgsUnstable = import nixpkgs-unstable { inherit system; };
        };

        modules = [
          musnix.nixosModules.musnix
          chaotic.nixosModules.default
          ./configuration.nix

          ({ ... }: {
            nixpkgs.config = {
              allowUnfree = true;
              permittedInsecurePackages = [ ];
            };
          })
        ];
      };
    };
}

{ config, pkgs, ... }:
let
  rastertostar = pkgs.callPackage ./rastertostar.nix {};
in {
  services.printing = {
    enable = true;
    drivers = [ rastertostar ];  # Adds compatibility for Star Micronics POS printers
  };
}

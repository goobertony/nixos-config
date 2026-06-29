{ config, pkgs, ... }:
let
  rastertostar = pkgs.callPackage ./rastertostar.nix { };
in
{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    enable = true;
    drivers = [
      rastertostar # Adds compatibility for Star Micronics POS printers
      pkgs.cups-filters
      pkgs.cups-browsed
    ];
  };
}

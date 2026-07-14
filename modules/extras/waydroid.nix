{ config, pkgs, ... }:
{
  virtualisation.waydroid.enable = true;
  networking.nftables.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables; 
  environment.systemPackages = with pkgs; [
    # cage
  ];
}

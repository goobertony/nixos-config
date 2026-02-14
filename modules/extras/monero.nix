{ lib, pkgs, ... }:
{
  services.monero = {
    enable = false;
  };
  networking.firewall.allowedTCPPorts = [
    18080
    28080
  ];

  environment.systemPackages = with pkgs; [
    monero-cli
    p2pool
    xmrig
  ];
}

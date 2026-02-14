{ pkgs, ... }:
{
  musnix.enable = true;
  environment.systemPackages = with pkgs; [
    tenacity # audacity fork
    renoise
    yabridge
    yabridgectl
    milkytracker
    ardour
  ];
}

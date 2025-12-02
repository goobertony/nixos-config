{ pkgs, ... }: {
  musnix.enable = true;
  enviroment.systemPackages = with pkgs; [
    tenacity # audacity fork
    renoise 
    yabridge
    yabridgectl
    milkytracker
  ]
}

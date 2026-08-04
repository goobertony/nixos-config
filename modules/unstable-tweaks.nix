# experimental kernel optimizations, overclocking and unstable packages
{ config, pkgs, pkgsUnstable, ... }:
{
  
environment.systemPackages = with pkgsUnstable; [meowfetch];

boot.kernelPackages = pkgs.linuxPackages_cachyos;

#overclocking
services.lact.enable = true;
hardware.amdgpu.overdrive.enable = true;
  
}

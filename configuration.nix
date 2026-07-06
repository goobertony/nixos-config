{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/bundle.nix
    ./packages.nix
  ];

  #  nixpkgs.overlays = [ inputs.polymc.overlay ];

  #gpu shit conf for rx 570
  hardware.amdgpu.opencl.enable = true;
  environment.variables = {
    _JAVA_AWT_WM_NONREPARENTING = 1; # for ghidra
    RUSTICL_ENABLE = "radeonsi";
    ROC_ENABLE_PRE_VEGA = "1";
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      libva
      libvdpau-va-gl
      vulkan-loader
      vulkan-validation-layers
      rocmPackages.clr.icd
      mesa.opencl # Enables Rusticl (OpenCL) support
    ];
  };
  nix.gc = {
    automatic = true;
    dates = "weeklyy";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.userControlled.enable = true;

  time.timeZone = "America/Chicago"; # Set your time zone.
  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # Enabling flakes

  system.stateVersion = "25.05"; # Don't change it vro

}

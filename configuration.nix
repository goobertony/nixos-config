{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/bundle.nix
    ./packages.nix
  ];


#  nixpkgs.overlays = [ inputs.polymc.overlay ];
hardware.amdgpu.opencl.enable = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.userControlled.enable =true;

  time.timeZone = "America/Chicago"; # Set your time zone.
  
  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

   nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "24.11"; # Don't change it vro

}

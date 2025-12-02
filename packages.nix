{config, pkgs, ... }:
 {
	#enable flatpaks
 # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 # xdg.portal.config.common.default = "gtk";
 # xdg.portal.enable =true ;
 # services.flatpak.enable = true;
 #  programs.nix-ld.enable = true;
 # programs.nix-ld.libraries = with pkgs; [
 #   # Add any missing dynamic libraries for unpackaged programs
 #   # here, NOT in environment.systemPackages
 #   fuse
 #   glibc
 # ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["googleearth-pro-7.3.6.10201" "python-2.7.18.8" "electron-25.9.0"];
    packageOverrides = pkgs: with pkgs; {
  };
};
programs.adb.enable = true;
  users.users.tonii.extraGroups = ["adbusers"];
  environment.systemPackages = with pkgs; [
     #NOTE, some system packages are contained in the module for the wm, niri.nix/dwm.nix etc, these mainly include bare essentials.
    # Desktop apps  
    librewolf # web browser of choice
    vlc
    helix #text editor
    dorion # discord
    termpdfpy #ebook reader
    tenacity
    # speedcrunch
    # user packages, for my personal uses
         # moved to modules/User.nix
    stow
    wget
    git
    fastfetch
    nix-index
    p7zip
    # GUI utils

    # stuff
    papirus-icon-theme
    alsa-utils

    # GPU stuff 
    amdvlk
    glib

    # Other

   # home-manager

  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    notonoto
    noto-fonts
    noto-fonts-emoji
    font-awesome
    
  ];
}

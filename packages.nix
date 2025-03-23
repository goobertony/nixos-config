{config, pkgs, ... }:
 {
	#enable flatpaks
 # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 # xdg.portal.config.common.default = "gtk";
 # xdg.portal.enable =true ;
 # services.flatpak.enable = true;
  programs.nix-ld.enable = true;
 # programs.nix-ld.libraries = with pkgs; [
 #   # Add any missing dynamic libraries for unpackaged programs
 #   # here, NOT in environment.systemPackages
 #   fuse
 #   glibc
  ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
    packageOverrides = pkgs: with pkgs; {
  };
};

  environment.systemPackages = with pkgs; [
     #NOTE, some system packages are contained in the module for the wm, niri.nix, these mainly include bare essentials.
    # Desktop apps  
    audacity
    kitty
    obs-studio
    librewolf # web browser of choice
    tor-browser
    ungoogled-chromium
#   geany
    nautilus
    gimp
    vlc
    helix #text editor
    webcord-vencord
    blugon
    wlsunset #blue light filter
    discord
    # user packages, for my personal uses
         # moved to modules/User.nix

    # Coding stuff
    qt5Full
    qtcreator
    cargo
    rustc
    go
    gnumake
    lxde.lxsession
    gcc
    nodejs

  python312Packages.pyqt5
   python
    (python3.withPackages (ps: with ps; [ requests ]))
    cmake
    pkg-config

    # CLIs & utils
    vim
    speedcrunch
    file
    tree
    font-manager
    wget
    git
    fastfetch
    cowsay
    fortune
    htop
    nix-index
    unzip
    scrot
    xclip
    ffmpeg
    light
    lux
    mediainfo
    ranger
    zram-generator
    cava
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    openssl
    bluez
    bluez-tools
    kdePackages.qtsvg
    wineWowPackages.stable
    p7zip
    
    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx

    # stuff
    papirus-icon-theme

    # WMs and stuff
    dunst

    # Sound
    pipewire
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
    comic-mono
    notonoto
    maple-mono-NF
    zpix-pixel-font
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    
  ];
}

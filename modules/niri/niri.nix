{
  lib,
  inputs,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=green;input=yellow --cmd niri-session";
        user = "greeter";
      };
    };
  };
  programs.niri = {
    enable = true;
    package = pkgsUnstable.niri;
  };

  programs.yazi = {
    enable = true;
    settings = {
      yazi = lib.importTOML ./yazi/yazi.toml;
      theme = lib.importTOML ./yazi/theme.toml;
    };
  };

  fonts.packages = with pkgs; [
    maple-mono.NF
    nerd-fonts.space-mono
    marwaita-icons
  ];

  environment.systemPackages = with pkgs; [
    # niri
    wl-clipboard
    polkit_gnome
    kitty
    mako
    awww
    xwayland-satellite
    catppuccin-cursors
    thunar
    btop
    concord
    foot
    fuzzel
    gtk3
    gtk4
    glib
    kitty
    # meowfetch
    mpd
    mpv
    niri
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default # noctalia unstable from flake
    qview
    rmpc
    satty
    grim
    slurp
    dconf
    gsettings-desktop-schemas
    xdg-desktop-portal-termfilechooser
  ];
  xdg.icons.fallbackCursorThemes = [ "mochaMaroon" ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    DISPLAY = "0";
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.gnome-keyring
      pkgs.xdg-desktop-portal-termfilechooser
    ];
  };
}

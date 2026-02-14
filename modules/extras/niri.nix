{ lib, pkgs, ... }:
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
  programs.waybar.enable = true;
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    niri
    wl-clipboard
    polkit_gnome
    kitty
    dmenu-wayland
    mako
    waybar
    swww
    xwayland-satellite
    bibata-cursors
  ];
  xdg.icons.fallbackCursorThemes = [ "Bibata-Modern-Ice" ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    DISPLAY = "0";
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}

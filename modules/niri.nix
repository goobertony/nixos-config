{ lib, pkgs, ... }:
{
services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=green;input=yellow --cmd niri-session";
        user = "greeter";
      };
    };
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;  
  };

  environment.systemPackages = with pkgs; [
    niri
    polkit_gnome
    kitty
    dmenu-wayland
    mako
    swww
    xwayland-satellite
  ];
  
  environment.variables = {
	NIXOS_OZONE_WL = "1";
        DISPLAY = "0";
   };
   xdg.portal = {
	enable = true;
	extraPortals = [pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-gtk ];
   };
}

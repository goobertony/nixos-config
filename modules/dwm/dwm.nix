{ lib, pkgs, ... }:
{
services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=green;input=yellow --cmd dwm";
        user = "greeter";
      };
    };
  };
  services.xserver = {
  enable = true;
  displayManager = {
    sessionCommands = ''export WINDOW_MANAGER=dwm '';
    startx.enable = true;
  };
  desktopManager.xfce = {
    enable = true;
    enableXfwm = false;
    noDesktop= true;
  };
  windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.override {
      patches = [
        (pkgs.fetchpatch {
          url = "https://dwm.suckless.org/patches/cool_autostart/dwm-cool_autostart-6.5.diff";
          hash = "sha256-ftyoQgnmogD1bwDlp9t88Qrm7UAnM/h6FdrrwIlVV2k=";
        })
        (pkgs.fetchpatch { 
          url = "https://dwm.suckless.org/patches/xfce4-panel/dwm-xfce4-panel-20220306-d39e2f3.diff";
          hash = "sha256-Z+B2qfGTdNY7RD7lbZM6SU9zyTxgdhl42o1mnhdqjqI=";
        })
      ];
      conf = ./config.def.h;
    };
  };
};
  environment.xfce.excludePackages = [
      pkgs.gnome-themes-extra
      pkgs.adwaita-icon-theme
      pkgs.hicolor-icon-theme
      pkgs.tango-icon-theme
      pkgs.xfce4-icon-theme
      pkgs.mousepad
      pkgs.parole
      pkgs.ristretto
      pkgs.xfce4-screenshooter
      pkgs.xfwm4
      pkgs.xfwm4-themes
      pkgs.xfce4-screensaver
      pkgs.xterm
  ];
  environment.systemPackages = with pkgs; [
    st-snazzy 
    imlib2
    xclip
    feh
    scrot
    # tuigreet
    dmenu
    blugon
    xfce4-panel
    xfce4-pulseaudio-plugin
    xfce4-sensors-plugin
    xfce4-systemload-plugin
    xfce4-mpc-plugin
    xfce4-timer-plugin
  ];

  
}

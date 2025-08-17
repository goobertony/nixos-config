{ lib, pkgs, ... }:
{
services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=green;input=yellow --cmd startx";
        user = "greeter";
      };
    };
  };
  services.xserver = {
  enable = true;
  displayManager.startx = {
    enable = true;
  };
  windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.override {
      patches = [
        (pkgs.fetchpatch {
          url = "https://dwm.suckless.org/patches/cool_autostart/dwm-cool_autostart-6.5.diff";
          hash = "sha256-ftyoQgnmogD1bwDlp9t88Qrm7UAnM/h6FdrrwIlVV2k=";
        })
      ];
      conf = ./config.def.h;
    };
  };
};
  environment.systemPackages = with pkgs; [
    st
    xclip
    feh
    scrot
    # tuigreet
    dmenu
  ];

  
}

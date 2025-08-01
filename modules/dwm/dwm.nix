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
      conf = ./config.def.h;
    };
  };
};
  environment.systemPackages = with pkgs; [
    st
    scrot
    # tuigreet
    dmenu
  ];

  
}

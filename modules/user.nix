{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  hardware.opentabletdriver.enable = true;

  users = {
    defaultUserShell = pkgs.fish;

    users.tonii = {
      isNormalUser = true;
      description = "tonii";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "libvirtd"
        "uinput"
        "wireshark"
      ];
      packages = with pkgs; [
        #User Packages
        mixxx
        midimonster
        libevdev
        # nicotine-plus
        anki
        rust-analyzer
        # imhex
        # osu-lazer-bin
        # renoise
        steam
        # kicad
        kanata
        # prismlauncher
      ];
    };
  };
  # Enable automatic login for the user.
  services.getty.autologinUser = "tonii";
}

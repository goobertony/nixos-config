{
  imports = [
    ./keyboard.nix
    ./bootloader.nix
    ./sound.nix
    ./user.nix
    ./nm.nix
    ./bluetooth.nix
    ./niri/niri.nix
    # ./mpd.nix
    # ./dwm/dwm.nix
    ./printing/printing.nix
    # ./extras/wireshark.nix
    ./extras/game-dev.nix # includes various creative tools used for making games
    # ./extras/monero.nix
    # ./extras/waydroid.nix #android emulator
    ./extras/dmp.nix # digital music production tools
  ];
}

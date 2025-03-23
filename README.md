# Nixos Configs
## current defaults
 - Bar: None
 - WM: niri
 - Text Editor: Helix
 - Browser: Librewolf, tor, and Ungoogled-chromium
 - Discord Client: Webcord + vencord and standard discord client installed

## Things you should change
### Comment out keyboard.nix in /modules/bundle.nix
Keyboard.nix is where i keep my configuration for my keyboard layout, and is mostly specific to my keyboard hardware and layout preferences.
### Check configs in /modules/user.nix
currently the username is not very editable as it is mentioned in many files and not declarative at this time, but things like shell and packages should be filtered through.

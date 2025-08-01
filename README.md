# Nixos Configs
## current defaults
 - Bar: None
 - WM: niri
 - Greeter: tuigreet
 - Text Editor: Helix, vim(installed but not configured/used)
 - Browser: Librewolf, tor, and Ungoogled-chromium
 - Discord Client: Webcord + vencord and standard discord client installed
# Other Configs
  All other program configs are found in the /yuri/.config folder 
# Things you should change
### Comment out keyboard.nix in /modules/bundle.nix
Keyboard.nix is where i keep my configuration for my keyboard layout, and is mostly specific to my keyboard hardware and layout preferences.
### Check configs in /modules/user.nix
currently the username is not very editable as it is mentioned in many files and not declarative at this time, but things like shell and packages should be filtered through.

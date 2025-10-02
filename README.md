# Nixos Configs
## current defaults
- dwm + xfce
- browser: Librewolf
- greeter: tuigreet
# Other Configs
  All other program configs (not related to the nix ecosystem) are found in the /yuri/.config folder 
# Things you should change
### Check modules/bundle.nix
disable/enable any modules you desire, ex: keyboard.nix contains my configs for how i personally use my keyboard
### Read the notice in modules/printing/
i have printer autism you will understand soon
### Check configs in /modules/user.nix
currently the username is not very editable as it is mentioned in many files and not declarative at this time, but things like shell and packages should be filtered through.

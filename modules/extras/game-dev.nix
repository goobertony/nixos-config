{ pkgs, ... }:
let
  trenchbroom = pkgs.callPackage ./trenchbroom.nix {};
in
{
  
  environment.systemPackages = with pkgs; [
    godot
    blender
    aseprite
    trenchbroom
  ];
}

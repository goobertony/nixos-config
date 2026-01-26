{ pkgs, programs, ... }:
{
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    package = pkgs.wireshark;
  };
  users.users.tonii.extraGroups = [ "wireshark" ];
  users.groups.wireshark.gid = 500;
  
}
             

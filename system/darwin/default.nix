{ ... }:
let
  hostname = "LoveSnowEx-MacBook";
  computerName = "LoveSnowEx's MacBook Air";
in
{
  imports = [
    ./common.nix
    ./homebrew.nix
    ./environment.nix
  ];

  # Hostname
  networking.computerName = "${computerName}";
  networking.hostName = "${hostname}";
  system.defaults.smb.NetBIOSName = "${hostname}";
  system.stateVersion = 5;
}

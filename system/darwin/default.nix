{ pkgs, lib, ... }:
let
  hostname = "LoveSnowEx-MacBook";
  computerName = "LoveSnowEx's MacBook Air";
in
{
  imports = [
    ./common.nix
    ./homebrew.nix
    ./system-package.nix
  ];

  # Hostname
  networking.computerName = "${computerName}";
  networking.hostName = "${hostname}";
  system.defaults.smb.NetBIOSName = "${hostname}";
}

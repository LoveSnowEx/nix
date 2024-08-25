{ pkgs, lib, ... }:
let
  username = "lovesnowex";
in
{
  nixpkgs.config.allowUnfree = true;
  home = {
    username = username;
    homeDirectory = lib.mkForce "/Users/${username}";
    stateVersion = "24.05";
    packages = with pkgs; [
      nil
      nixpkgs-fmt
    ];
  };
  programs.home-manager.enable = true;
}

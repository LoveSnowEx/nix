{ pkgs, lib, ... }:
let
  username = "lovesnowex";
in
{
  imports = [
    ./zsh
  ];
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
  programs.git = {
    # Sign
    # signing = {
    #   signByDefault = true;
    #   key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIlmEeuqIj2EQuHMhiua+C34/mibY9KeMwAyQNj299nl";
    # };
    # extraConfig = {
    #   gpg = {
    #     format = "ssh";
    #     ssh = {
    #       program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    #     };
    #   };
    # };
  };
  programs.home-manager.enable = true;
}

{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      bashInteractive
      cmake
      openssh
      zsh
      wget
      nil
    ];
    shells = with pkgs; [
      bashInteractive
      zsh
    ];
  };
}

{ pkgs, lib, ... }:
let
  username = "pinkoi";
in
{
  home = {
    username = username;
    homeDirectory = lib.mkForce "/Users/${username}";
    stateVersion = "26.05";
    packages = with pkgs; [
      nixd
      nixpkgs-fmt
      nix-tree
      nix-output-monitor
      act
      btop
      devenv
      discordo
      dust
      hadolint
      graphviz
      ijq
      just
      jwt-cli
      mas
      micro
      moreutils
      gomi
      nodejs_22
      python312
      ripgrep
      sqlite
      tcping-go
      tree
      typst
      typstyle
      uutils-coreutils-noprefix
      zulu17
      llm-agents.pi
    ];
    language = {
      base = "en_US.UTF-8";
      ctype = "en_US.UTF-8";
      numeric = "en_US.UTF-8";
      time = "en_US.UTF-8";
      collate = "en_US.UTF-8";
      monetary = "en_US.UTF-8";
      messages = "en_US.UTF-8";
      paper = "en_US.UTF-8";
      name = "en_US.UTF-8";
      address = "en_US.UTF-8";
      telephone = "en_US.UTF-8";
      measurement = "en_US.UTF-8";
    };
  };
  programs.home-manager.enable = true;
}

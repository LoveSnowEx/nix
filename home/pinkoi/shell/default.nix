{ ... }:
{
  imports = [
    ./starship.nix
    ./zsh
  ];

  programs = {
    bat = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
    };

    fd = {
      enable = true;
    };

    fzf = {
      enable = true;
    };

    gh = {
      enable = true;
    };

    go = {
      enable = true;
    };

    jq = {
      enable = true;
    };

    zoxide = {
      enable = true;
    };
  };
}

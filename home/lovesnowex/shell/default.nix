{ ... }:
{
  imports = [
    ./starship.nix
    ./zsh.nix
  ];

  programs = {
    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    go = {
      enable = true;
    };
  };
}

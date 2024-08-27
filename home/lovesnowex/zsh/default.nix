{ ... }:
{
  imports = [
    ./starship.nix
  ];
  programs = {
    zsh = {
      enable = true;
      enableCompletion = false;
      completionInit = ''
        autoload -Uz compinit
        if [[ ! -e ~/.zcompdump(N.mh+24) ]]; then
          compinit
        else
          compinit -C
        fi
      '';
      autocd = true;
      zprof.enable = true;
      zimfw = import ./zimfw.nix;
    };

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
  };
}

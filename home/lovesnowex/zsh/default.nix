{ ... }:
{
  imports = [
    ./starship.nix
  ];

  programs.zsh = {
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
    zimfw = import ./zimfw.nix;
  };
}

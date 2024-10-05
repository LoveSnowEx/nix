{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
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
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
      ignoreSpace = true;
    };
    initExtra = import ./init_extra.nix;
    shellAliases = {
      b = "bat";
      d = "docker";
      dc = "docker compose";
      e = "echo";
      grep = "grep --color=auto";
      m = "micro";
      mkdir = "mkdir -pv";
      rm = "gomi";
    };
  };
}

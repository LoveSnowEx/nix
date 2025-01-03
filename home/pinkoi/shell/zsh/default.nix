{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
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

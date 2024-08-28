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
    initExtra = ''
      setopt HIST_FIND_NO_DUPS
      export HISTORY_SUBSTRING_SEARCH_PREFIXED=1
      export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
    '';
  };
}

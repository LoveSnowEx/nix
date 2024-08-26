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
    zimfw = {
      enable = true;
      degit = true;
      disableVersionCheck = true;
      zmodules = [
        "environment"
        "input"
        "run-help"
        "completion"
        "zsh-users/zsh-completions --fpath src"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-history-substring-search"
        "zsh-users/zsh-syntax-highlighting"
        "homebrew"
        "archive"
        "exa"
        "ssh"
        "termtitle"
        "utility"
        "Aloxaf/fzf-tab"
        "wookayin/fzf-fasd"
        "wfxr/forgit"
        "MichaelAquilina/zsh-you-should-use"
        "greymd/docker-zsh-completion"
        "zdharma-continuum/fast-syntax-highlighting"
        "joke/zim-github-cli"
      ];
    };
  };
}

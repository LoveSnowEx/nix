final: prev: {
  zimfw = prev.zimfw.overrideAttrs (oldAttrs: rec {
    version = "1.14.0";
    src = prev.fetchFromGitHub {
      owner = "zimfw";
      repo = "zimfw";
      rev = "v${version}";
      ## zim only needs this one file to be installed.
      sparseCheckout = [ "zimfw.zsh" ];
      sha256 = "sha256-5al9W3LOIUtXParNO1DYldzWBkUC6zRS+CWgGeAdk4M=";
    };
  });
}

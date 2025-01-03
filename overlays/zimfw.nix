final: prev: {
  zimfw = prev.zimfw.overrideAttrs (oldAttrs: rec {
    version = "1.15.0";
    src = prev.fetchFromGitHub {
      owner = "zimfw";
      repo = "zimfw";
      rev = "v${version}";
      ## zim only needs this one file to be installed.
      sparseCheckout = [ "zimfw.zsh" ];
      sha256 = "sha256-8GnxUhBvMy7fhDILDKYEf/9Mhgzz7suaiZ5elRZmT0o=";
    };
  });
}

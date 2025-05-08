{ ... }:
{
  programs.git = {
    enable = true;
    userName = "LoveSnowEx";
    userEmail = "tavie.kuo@pinkoi.com";
    signing = {
      signByDefault = true;
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICCO49BXJGWDTvb3Gp1Sx+t6skWec3D9vNC2hOsQRokR";
    };
    extraConfig = {
      commit.gpgSign = true;
      gpg = {
        format = "ssh";
        ssh = {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          allowedSignersFile = "~/.config/git/allowed_signers";
        };
      };
      push.autoSetupRemote = true;
      fetch.prune = true;
    };
  };
}

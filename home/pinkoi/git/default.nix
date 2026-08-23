{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "LoveSnowEx";
      user.email = "tavie.kuo@pinkoi.com";
      commit.gpgSign = true;
      gpg = {
        format = "ssh";
        ssh = {
          program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          allowedSignersFile = "~/.config/git/allowed_signers";
        };
      };
      push.autoSetupRemote = true;
    };
    signing = {
      signByDefault = true;
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICCO49BXJGWDTvb3Gp1Sx+t6skWec3D9vNC2hOsQRokR";
    };
  };
}

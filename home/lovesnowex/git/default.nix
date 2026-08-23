{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "LoveSnowEx";
      user.email = "lsktw22@gmail.com";
      commit.gpgSign = true;
      gpg = {
        format = "ssh";
        ssh = {
          defaultKeyCommand = "ssh-add -L";
          allowedSignersFile = "~/.ssh/allowed_signers";
        };
      };
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
    signing = {
      signByDefault = true;
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICumxsUjMJPkNIyLlj4L1BYRYs6gBoozSDQw1GEVKWt5 lsktw22@gmail.com";
    };
  };
}

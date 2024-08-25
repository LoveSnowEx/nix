{ ... }:
{
  nixpkgs.overlays = [
    (import ./zimfw.nix)
  ];
}

{
  description = "A very basic flake";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      # Query the mirror of USTC first, and then the official cache.
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    # NixPKG
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";

    # Home Manager
    home-manager-darwin = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    # Nix Darwin
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = { nixpkgs-darwin, home-manager-darwin, darwin, ... }: {
    formatter.aarch64-darwin = nixpkgs-darwin.legacyPackages.aarch64-darwin.nixpkgs-fmt;

    darwinConfigurations ={
      "macbook" =
        darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./system/macbook
            (import ./overlays)
            home-manager-darwin.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users = {
                lovesnowex = import ./home/lovesnowex/macos.nix;
              };
              # home-manager.extraSpecialArgs = {
              #       naersk = inputs.naersk;
              # };
              home-manager.sharedModules = [
                (import ./lib/zimfw home-manager-darwin)
              ];
            }
          ];
        };
    };
  };
}

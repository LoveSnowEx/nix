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

  outputs = { nixpkgs-darwin, home-manager-darwin, darwin, ... }@inputs:
    let
      system = "aarch64-darwin";
    in
    {
      formatter.${system} = nixpkgs-darwin.legacyPackages.${system}.nixpkgs-fmt;

      darwinConfigurations = {
        "macbook" = darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ./system/darwin
            home-manager-darwin.darwinModules.home-manager
            {
              nixpkgs.overlays = import ./overlays;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users = {
                  lovesnowex = import ./home/lovesnowex;
                };
                extraSpecialArgs = { inherit inputs; };
                sharedModules = [
                  (import ./lib/zimfw home-manager-darwin)
                ];
              };
            }
          ];
        };
      };
    };
}

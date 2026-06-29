{
  description = "A very basic flake";

  inputs = {
    # NixPKG
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Home Manager
    home-manager-darwin = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    # Nix Darwin
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { nixpkgs-darwin, home-manager-darwin, darwin, llm-agents, ... }@inputs:
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
        "pinkoi-macbook" = darwin.lib.darwinSystem {
        inherit system;
        modules = [
            ./system/darwin
            home-manager-darwin.darwinModules.home-manager
            {
              nixpkgs.overlays = import ./overlays { inherit llm-agents; };
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users = {
                  pinkoi = import ./home/pinkoi;
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

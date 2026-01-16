{
  description = "My first flake!";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows="nixpkgs";
    };

  };
  outputs = {self, nixpkgs, nixpkgs_unstable, home-manager, niri-flake, ...} @ inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs_unstable.legacyPackages.${system};
    in {
    nixosConfigurations = {
      gustav = lib.nixosSystem {
        inherit system;
	modules = [ ./modules/system/configuration.nix ];
	specialArgs = {
          inherit pkgs-unstable;
	};
      };
    };
    homeConfigurations = {
      gustav = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; # Som input = input.
	modules = [ 
	  niri-flake.homeModules.niri
	./modules/home/home.nix ];
	extraSpecialArgs = {
          inherit pkgs-unstable;
	};
      };
    };

  };
}

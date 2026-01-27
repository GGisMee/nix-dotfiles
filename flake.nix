{
  description = "My first flake!";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    # Spotify but cli
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {self, nixpkgs, nixpkgs_unstable, home-manager, spicetify-nix, ...} @ inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
	inherit system;
	config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs_unstable {
        inherit system;
	config.allowUnfree = true;
      };
    in {
    nixosConfigurations = {
      gustav = lib.nixosSystem {
        inherit system;
	modules = [ ./system/configuration.nix ];
	specialArgs = {
          inherit pkgs-unstable;
	};
      };
    };
    homeConfigurations = {
      gustav = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; # Som input = input.
	modules = [ 
	  spicetify-nix.homeManagerModules.default
	  ./home.nix 
	  inputs.stylix.nixosModules.stylix
	];
	extraSpecialArgs = {
          inherit pkgs-unstable inputs;
	};
      };
    };

  };
}

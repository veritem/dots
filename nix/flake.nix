{
  description = "mydotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

  outputs = inputs: {
    defaultPackage.x86_64-linux = inputs.home-manager.defaultPackage.x86_64-linux;
    defaultPackage.aarch64-darwin = inputs.home-manager.defaultPackage.aarch64-darwin;

    homeConfigurations = {
      "veritem" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit (inputs) home-manager;
        system = "aarch64-darwin";
        homeDirectory = "/Users/veritem";
        username = "veritem";
		configuration = import /home/veritem/dev/dots/home.nix;
      };
    };
  };
}

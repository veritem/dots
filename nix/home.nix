{ pkgs,... }: {
	programs.home-manager.enable = true;

	home.packages = [
		pkgs.cowsay
	];
}
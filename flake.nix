{
	description = "NixOS configuration";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        picom.url = "github:yshui/picom";
	};

	outputs = inputs@{self, nixpkgs, home-manager,picom, ... }: {
		nixosConfigurations = {
			hack = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
						home-manager.nixosModules.home-manager
						{
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;
							home-manager.users.krovuxdev = import ./home.nix;
							home-manager.extraSpecialArgs = {
								inherit inputs picom;
							};
						}
				];
			};
		};
	};
}

{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
    picom.url = "github:yshui/picom";
    changevolume = {
      url = "github:krovuxdev/changevolume/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    picom,
    changevolume,
    ...
  } @ inputs: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      "Nixos-Green" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        #extraArgs = {inherit rust-overlay;};
        modules = [
          ./hosts/Nixos-Green/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.krovuxdev = import ./home/krovuxdev/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs picom;
              changevolume = changevolume.nixosModules.changevolume;
            };
            _module.args = {inherit rust-overlay;};
          }
        ];
      };
    };
  };
}

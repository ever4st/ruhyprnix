{
  description = "My minimal Nix Os flake (visual only)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    # Подключаем базу HydeNix для визуала
    hydenix.url = "github:richen604/hydenix";
    
    # Полезные модули для железа
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.no4einb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop/configuration.nix
      ];
    };
  };
}

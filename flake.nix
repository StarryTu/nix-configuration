{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, nix-flatpak }: {
    nixosConfigurations = {
      
      # MÁQUINA ATUAL (Antiga)
      ArthurNix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix # Arquivo de hardware atual renomeado
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };

    };
  };
}


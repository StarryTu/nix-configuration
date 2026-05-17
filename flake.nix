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

      # MÁQUINA NOVA
      NixOS = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # Altere se a nova máquina usar outra arquitetura
        modules = [
          ./configuration.nix
          ./hardware/novo-pc.nix # Reutiliza a mesma configuração 
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };

    };
  };
}


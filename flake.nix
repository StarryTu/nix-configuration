{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs"; # Garante a mesma versão de pacotes
    };
  };

   outputs = { self, nixpkgs, nix-flatpak, home-manager, ... }@inputs: {
    nixosConfigurations = {

      # MÁQUINA ATUAL (Antiga)
      ArthurNix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        
        # Passa as inputs do flake para os arquivos configuration.nix e outros módulos
        specialArgs = { inherit inputs; }; 

        modules = [
          ./configuration.nix
          ./hardware-configuration.nix # Arquivo de hardware atual renomeado
          
          # Módulos das suas inputs
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          
          # Configuração do Home Manager integrada ao NixOS
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            
            # Passa as inputs também para dentro do seu home.nix
            home-manager.extraSpecialArgs = { inherit inputs; }; 
            
            # IMPORTANTE: Altere "meu_usuario" para o seu nome de usuário real no Linux
            home-manager.users.arthur =  ./home.nix;
          }
        ];
      };

    };
  };

}


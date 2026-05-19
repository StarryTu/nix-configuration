{config, inputs, ...}:
{
  home.username = "arthur";
  home.homeDirectory = "/home/arthur";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  
  imports = [
    ./ghostty.nix
  ];

}
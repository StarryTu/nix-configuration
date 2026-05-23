{config, pkgs , ...}:
{
  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    ssh.startAgent = true;
    
  };
  environment.systemPackages = with pkgs; [
    vim 
    wget
    vscode
    fastfetch
    git
    google-chrome
    nixd
    nixfmt
    gparted
    vlc 
    discord
    spotify
    libreoffice
    jdk
  ];
}

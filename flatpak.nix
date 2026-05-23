{config, pkgs,  ...}:
{
    services.flatpak ={
        enable  = true;
        packages = ["org.vinegarhq.Sober" "org.prismlauncher.PrismLauncher" "org.gnome.Calculator" "io.mrarm.mcpelauncher" "sh.ppy.osu"];
        update.auto = {
          enable = true;
      };
      update.onActivation = true;
    };
    environment.profiles = [
        "$HOME/.local/share/flatpak/exports/share"
        "/var/lib/flatpak/exports/share"
    ];

   systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub "https://dl.flathub.org/repo/flathub.flatpakrepo"
    '';
  };

}
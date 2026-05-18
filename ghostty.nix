{pkgs, ...}:
{
  programs.ghostty =  {
    enable = true;
    package = pkgs.ghostty; 
    settings ={
      font-family = "JetBrains Mono";
      font-size = 12;
      window-padding-x = 10;
      window-padding-y = 10;
      keybind = [
        "ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
      ];
    # Comportamento do Copiar/Colar (veja os detalhes abaixo)
      clipboard-trim-trailing-spaces = true;
      clipboard-paste-bracketed-safe = true;
    };
  };
}
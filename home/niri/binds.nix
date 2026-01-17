{config,...}:
{

  # Niri Konfiguration
  programs.niri.settings = {
    input = {
      keyboard.xkb.layout = "se";
    };


    # Autostart: Bakgrund + Notiser
    spawn-at-startup = [
      { command = [ "swww-daemon" ]; }
      { command = [ "swaync" ]; }
    ];

    # Keybindings
    binds = {
      "Super+D".action.spawn = [ "fuzzel" ];
      "Super+L".action.spawn = [ "hyprlock" ];
      "Super+T".action.spawn = [ "kitty" ];
      "Super+Q".action.close-window = [];
      "Super+Shift+E".action.quit = [];
      
    };

    # Layout & Design
    layout = {
      gaps = 10;
      center-focused-column = "never";
    };
  };
}

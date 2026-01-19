{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swww-daemon"                      # Startar bakgrundsmotorn
      "waybar"                          # Startar panelen
      "swaync"                          # Startar notis-center
      "hyprlock"                        # Låser skärmen direkt vid inloggning (valfritt)
    ];
  # ... monitor, misc etc
  };
}

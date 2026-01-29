{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "swww-daemon"                      # Startar bakgrundsmotorn
      "waybar"                          # Startar panelen
      "swaync"                          # Startar notis-center
      "hyprlock"                        # Låser skärmen direkt vid inloggning (valfritt)
    ];
  # ... monitor, misc etc
  };
}

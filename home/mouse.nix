{ pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.volantes-cursors;
    name = "volantes_cursors"; # Eller "volantes_light_cursors" / "volantes_manjaro_cursors"
    size = 23;
  };
  wayland.windowManager.hyprland.settings = {
    # Tvingar miljövariabeln in i Hyprlands session
    env = [
      "XCURSOR_SIZE,23"
    ];
  
    # Din befintliga xwayland-fix
    xwayland = {
      force_zero_scaling = true;
    };
  };

  # Försök att fixa långsam mus på dator
  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = false; # Tvingar hårdvaru-rendering
  };
  render.direct_scanout = true;
  misc = {
    vfr = true;
    vrr = 1;
  };
};
}

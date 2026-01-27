{pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.group = {
    insert_after_current = true;
    groupbar = {
      enabled = true;          # Visar flikar högst upp
      font_size = 10;
      height = 20;
      render_titles = true;    # Visar fönsternamn i flikarna
      gradients = true;

    };
  };
}

{pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.group = {
    bind_to_group = true;
    insert_after_current = true;
    "col.border_active" = "rgba(33ccffee) rgba(00ff99ee) 45deg"; # Tydlig färg för aktiva grupper
    groupbar = {
      enabled = true;          # Visar flikar högst upp
      font_size = 10;
      height = 20;
      render_titles = true;    # Visar fönsternamn i flikarna
      gradients = true;
    };
  };
}

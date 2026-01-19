{pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.group = {
    insert_after_current = true;
    "col.border_active" = "rgba(00f2ffee) rgba(0066ffee) 45deg";
    "col.border_inactive" = "rgba(1e1e2eff)";
    groupbar = {
      enabled = true;          # Visar flikar högst upp
      font_size = 10;
      height = 20;
      render_titles = true;    # Visar fönsternamn i flikarna
      gradients = true;

      "col.inactive" = "rgba(11111bff)";   # inactive tab color [web:1]

      # background for active tab
      "col.active"   = "rgba(0066ffee)";  # active tab color [web:1]
    };
  };
}

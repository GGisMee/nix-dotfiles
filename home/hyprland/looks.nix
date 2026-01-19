{
  wayland.windowManager.hyprland.settings = {

    animations = {
      enabled = true;
      bezier = "myBezier, 0.075, 0.7, 0.075, 1.05";

      animation = [
        "windows, 1, 5, myBezier"
        "windowsOut, 1, 5, default, popin 70%"
        "border, 1, 5, default"
        "borderangle, 1, 5, default"
        "fade, 1, 2, default"
        "workspaces, 1, 5, default"
      ];
    };

    decoration = {
      rounding = 15;

      blur = { # Egentligen onödig om windowsen inte är genomskinliga
        enabled = true;
        size = 9;
        passes = 2;
      };
    };
  };
}

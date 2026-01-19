{ pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.volantes-cursors;
    name = "volantes_cursors"; # Eller "volantes_light_cursors" / "volantes_manjaro_cursors"
    size = 23;
};
}

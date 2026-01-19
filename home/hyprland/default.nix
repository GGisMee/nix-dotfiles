{
  imports = [
    ./binds.nix
    ./stack.nix
    ./looks.nix
    ./mouse.nix
    ./monitor.nix
  ];

   # Removes default background for custom choices
  wayland.windowManager.hyprland.settings = {
    misc = {
      disable_hyprland_logo = true;
      force_default_wallpaper = -1;
    };
  };
}

{
  # 1. Synka Hyprlands statiska inställningar
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-1, 3840x2160@100, 0x0, 1.5" 
    "eDP-1, 2880x1800@120, 2560x0, 2" # 3840/1.5 = 2560
  ];

  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            transform = "normal";
            scale = 2.0;
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "DP-1";
            mode = "3840x2160@100Hz";
            scale = 1.5;
            position = "0,0";
          }
          {
            criteria = "eDP-1";
            mode = "2880x1800@120Hz"; # Specifikt läge
            transform = "270"; 
            scale = 2.0;
            position = "2560,0"; # Måste vara exakt 2560
          }
        ];
      }
    ];
  };
}

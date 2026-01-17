{config,...}:
{

  # Niri Konfiguration
  programs.niri.settings = {
    input = {
      keyboard.xkb.layout = "se";
    };


    # Autostart: Bakgrund + Notiser
    spawn-at-startup = [
      { command = [ "swww-daemon" ]; }
      { command = [ "swaync" ]; }
    ];

    # Keybindings
    binds = {
      
      "Mod+D".action.spawn = [ "fuzzel" ];
      "Mod+L".action.spawn = [ "hyprlock" ];
      "Mod+T".action.spawn = [ "kitty" ]; # Terminal
      "Mod+Q".action.close-window = []; # Close window
      "Mod+Shift+E".action.quit = []; # Exit niri
      
      # "Mod+Ctrl+Left".action = "move-column-left";
      # "Mod+Ctrl+Right".action = "move-column-right";
      # "Mod+Ctrl+Up".action = "move-window-up";
      # "Mod+Ctrl+Down".action = "move-window-down";
      # "Mod+Ctrl+H".action = "move-column-left"; 
      # "Mod+Ctrl+K".action = "move-window-up"; 
      # "Mod+Ctrl+L".action = "move-column-right";

      # F keys
      "F12".action= {screenshot = {};};
      "F12+shift".action= {screenshot-window = {};};

 
      "XF86AudioRaiseVolume".action.spawn = [
      "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@"
      "0.1+"
      ];
      "XF86AudioRaiseVolume".allow-when-locked = true;
      "XF86AudioLowerVolume".action.spawn = [
	      "wpctl"
		      "set-volume"
		      "@DEFAULT_AUDIO_SINK@"
		      "0.1-"
      ];
      "XF86AudioLowerVolume".allow-when-locked = true;
      "XF86AudioMute".action.spawn = [
	      "wpctl"
		      "set-mute"
		      "@DEFAULT_AUDIO_SINK@"
		      "toggle"
      ];
      "XF86AudioMute".allow-when-locked = true;
      "XF86AudioMicMute".action.spawn = [
	      "wpctl"
		      "set-mute"
		      "@DEFAULT_AUDIO_SOURCE@"
		      "toggle"
      ];
      "XF86AudioMicMute".allow-when-locked = true;
    };

    # Layout & Design
    layout = {
      gaps = 10;
      center-focused-column = "never";
    };
  };
}

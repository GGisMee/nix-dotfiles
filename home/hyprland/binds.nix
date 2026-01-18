{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input = {
        kb_layout = "se";
	follow_mouse = 0; # klicka på fönster för att aktivera
	};

	"$mod" = "SUPER";
	"$caps" = "CONTROL_SHIFT_ALT_SUPER"; # kort för remap caps till dessa
	bind = [
	  # Apps
	  "$mod, $mod_L, exec, pkill fuzzel || fuzzel"
	  "$mod, T, exec, kitty"
	  "$mod, B, exec, firefox"
	  "$mod, N, exec, obsidian"

	  # Shortcut keys
	  "$mod, Q, killactive,"
	  "$mod, V, togglefloating,"

	  # Change windows
	  "$mod, h, movefocus, l"
	  "$mod, l, movefocus, r"
	  "$mod, k, movefocus, u"
	  "$mod, j, movefocus, d"

	  # Maximize
	  "$mod, m, fullscreen, 1"

	  # Move window
	  "$mod SHIFT, h,  movewindow, l"
	  "$mod SHIFT, l, movewindow, r"
	  "$mod SHIFT, k,    movewindow, u"
	  "$mod SHIFT, j,  movewindow, d"

	  # Move window to adjacent workspace
	  "$caps,h, workspace, -1" # Super + [ - byt workspace
	  "$caps, l, workspace, +1" # Super + ]
	  "$caps, k,  movetoworkspace, -1" # flytta window
	  "$caps, j, movetoworkspace, +1"


	  # Power of or on
	  "$mod Shift, Escape, exec, systemctl poweroff"
	  "$mod, Escape, exec, systemctl suspend"

	  # Screenshot
	  "$mod Shift, S, exec, grim -g \"$(slurp)\" - | wl-copy || pkill grim"
	];
	binde = [
# Ljudvolym (Wireplumber)
		", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
			", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

# Ljusstyrka (brightnessctl)
			", XF86MonBrightnessUp, exec, brightnessctl set +5%"
			", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
	];

	bindl = [
# Media-kontroll (playerctl)
		", XF86AudioPlay, exec, playerctl play-pause"
			", XF86AudioNext, exec, playerctl next"
			", XF86AudioPrev, exec, playerctl previous"
			", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	];
      };
  };
}

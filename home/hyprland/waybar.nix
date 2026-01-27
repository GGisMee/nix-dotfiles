{
programs.waybar = {
  enable = true;
  systemd.enable = true; # Startar automatiskt vid inloggning
  
settings = {
  mainBar = {
    # ... tidigare kod
    modules-right = [ "pulseaudio" "network" "cpu" "memory" "clock" "tray" ];

    "network" = {
      format-wifi = "  {essid} ";
      format-ethernet = "  {ifname} ";
      format-disconnected = "  Disconnected ";
    };

    "cpu" = {
      format = "  {usage}% ";
    };

    "memory" = {
      format = "  {}% ";
    };

    "clock" = {
      format = "  {:%H:%M} ";
    };
  };
};
  style = ''
    * { border: none; font-family: sans-serif; }
    window#waybar { background: rgba(0, 0, 0, 0.5); color: white; }
    #workspaces button { padding: 0 5px; color: #777; }
    #workspaces button.active { color: white; }
  '';
};
}

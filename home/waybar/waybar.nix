{ config, pkgs, ... }:

let
  # Definiera baren en gång här
  commonSettings = {
    layer = "top";
    position = "top";
    spacing = 4;
    modules-left = [ "custom/spacer" "hyprland/workspaces" ];
    modules-right = [ "tray" "custom/kernel" "cpu" "memory" "custom/diskfree" "clock" "custom/power" ];

    "hyprland/workspaces" = {
      on-click = "activate";
      format = "{name}: {icon}";
      format-icons = {
        "1" = ""; "2" = ""; "3" = ""; "4" = ""; "5" = "";
        "default" = "";
      };
    };

    "cpu" = { format = "⧯ Cpu: {usage}%"; tooltip = false; };
    "memory" = { interval = 5; format = "󰍛 Mem: {}%"; };
    "clock" = { format = "⏱ {:%a, %b %d - %H:%M}"; };

    "custom/kernel" = {
      format = "❤ {}";
      exec = "uname -r";
      interval = 3600;
    };

    "custom/diskfree" = {
      format = "🖴 Disk: {} used";
      exec = "df -h / | tail -1 | awk '{print $5}'";
      interval = 300;
    };

    "custom/spacer" = { format = "  "; };
    "custom/power" = {
      format = "󰤆";
      on-click = "hyprctl dispatch exit";
    };
  };
in
{
  programs.waybar = {
    enable = true;
    settings = {
      # Laptop
      #mainBar = commonSettings // {
      #  output = "eDP-1";
      #  height = 32;
      #};

      # Monitor
      #externalBar = commonSettings // {
      #  output = "DP-1"; # Kolla med 'hyprctl monitors'
      #  height = 48;
      #};
    };
  };
}

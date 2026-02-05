{
wayland.windowManager.hyprland.settings = {
  bindl = [
    # När tablet mode aktiveras: Tvinga på Kanata och Keychron direkt
    ", switch:on:Intel HID switches, exec, hyprctl keyword device:kanata:enabled true"
    ", switch:on:Intel HID switches, exec, hyprctl keyword device:keychron--keychron-link--keyboard:enabled true"
    
    # Gör samma för HP-specifika switchen för säkerhets skull
    ", switch:on:HP WMI hotkeys, exec, hyprctl keyword device:kanata:enabled true"
    
    # Valfritt: Stäng av laptopens inbyggda tangentbord (det fysiska) 
    # så du inte skriver med knäna, men behåll Kanata aktiv
    ", switch:on:Intel HID switches, exec, hyprctl keyword device:at-translated-set-2-keyboard:enabled false"
    ", switch:off:Intel HID switches, exec, hyprctl keyword device:at-translated-set-2-keyboard:enabled true"
  ];
};
}

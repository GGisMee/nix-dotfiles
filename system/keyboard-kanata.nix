{...}:
{
services.kanata = {
  enable = true;
  keyboards.default = {
    # Hämta namnen via: ls /dev/input/by-id/
    config = ''
      (defsrc caps)
      (defalias hyper (multi lctl lmet lalt lshift))
      (deflayer base @hyper)
    '';
  };
};
# Inställningar som gör att keychron keyboard är på även vid tabletmode
# Aktivera sensorer för rotation och tablet-mode detektering
hardware.sensor.iio.enable = true;


services.udev.extraRules = ''
  # Hitta switchen och säg till libinput att ignorera den
  ATTRS{name}=="Intel HID switches", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  ATTRS{name}=="HP WMI hotkeys", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  ATTRS{name}=="Lid Switch", ENV{LIBINPUT_IGNORE_DEVICE}="1"
'';
}

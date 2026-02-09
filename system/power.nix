{ config, pkgs, ... }:

{
  # 1. Senaste kärnan för Meteor Lake-stöd
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # 2. Strömhantering
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never"; # Sparar mycket batteri
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  # 3. Termisk kontroll (Intel-specifikt)
  services.thermald.enable = true;

  # 4. Hårdvaruacceleration för iGPU (Minskar CPU-last vid video)
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };

  # 5. Batterianalys
  powerManagement.powertop.enable = true;
}

{ pkgs, lib, config, ... }: 
{
  stylix.targets.firefox.enable = true;
  stylix.targets.firefox.profileNames = [ "gustav" ];

  programs.firefox = {
    enable = true;
    profiles.gustav = {
      id = 0;
      isDefault = true;
      
      search = {
        # Ändra till false för att undvika konflikt med ditt online-konto
        force = false; 
        default = "ddg"; 
        order = [ "ddg" "google" ];
      };

      settings = {
        # KRITISKA inställningar för Stylix
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "svg.context-properties.content.enabled" = true;
      };
    };
  };
}

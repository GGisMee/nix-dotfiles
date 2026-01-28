{pkgs, lib,...}: 
{
stylix.targets.firefox.enable = false;
programs.firefox = {
  enable = true;
  #profiles.gustav = {  # Här sätter du namnet till "gustav"
  #  id = 0;
  #  isDefault = true;
  #  settings = {
  #    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  #  };
    # Inställningar för profilen kan läggas här
  # };
};
  # Tvinga Stylix att registrera Firefox-målet här
  # stylix.targets.firefox.enable = lib.mkForce true;
  # stylix.targets.firefox.profileNames = [ "gustav" ];
}

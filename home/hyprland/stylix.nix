{pkgs, ...}:
{
  stylix = {
    enable = true;
    image = ./nix_wallpaper.png; # Required: path to your wallpaper
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  
    # Optional: Define global font settings
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}

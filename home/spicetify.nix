{ pkgs, inputs, ... }:
{
programs.spicetify =
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  utils = import ../lib/utils.nix { inherit pkgs; };
in
{
  enable = true;
  spotifyPackage = pkgs.spotify.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      wrapProgram $out/bin/spotify \
      --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
    '';
  }); 
  enabledExtensions = with spicePkgs.extensions; [
    adblock
    hidePodcasts
    shuffle # shuffle+ (special characters are sanitized out of extension names)
  ];
  enabledCustomApps = with spicePkgs.apps; [
    newReleases
    ncsVisualizer
  ];
  enabledSnippets = with spicePkgs.snippets; [
    rotatingCoverart
    pointer
  ];

  theme = spicePkgs.themes.catppuccin;
  colorScheme = "mocha";
};
}

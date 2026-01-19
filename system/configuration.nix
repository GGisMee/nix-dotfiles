# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable flakes
  nix = {
  # packages = pkgs.nix; # For home manager
  settings.experimental-features = [ "nix-command" "flakes" ];
  };
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "gustav"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "sv_SE.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1";
  };
  services.xserver.xkb = {
    layout = "se";
    variant = "";
	};


  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
  hardware.uinput.enable = true;
  # Använder kanata programmet som helt enkelt mappar caps till shift+ctrl+super+alt
  services.kanata = {
  enable = true;
  keyboards.default = {
    config = ''
      (defsrc caps)
      (defalias hyper (multi lctl lmet lalt lshift))
      (deflayer base @hyper)
    '';
  };
};
  # display manager
  
  # Cosmic stuff
  # services.displayManager.cosmic-greeter.enable = true;
  # services.desktopManager.cosmic.enable = true;

  # Gammalt
  # services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  
  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    # defaultSession = "niri";
  };
  hardware.graphics.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland ];
  };

  # programs.niri.enable = true;
  programs.hyprland.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true; # for games with support for older systems
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Bluetooth - G
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gustav = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" "uinput"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      obsidian
      spotify
      (pkgs.vscode-with-extensions.override {
       vscode = pkgs.vscode.override {
       commandLineArgs = [
       "--enable-features=UseOzonePlatform"
       "--ozone-platform=wayland"
       "--force-device-scale-factor=1"
       ];
       };
       })
    ];
  };
  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  programs.steam.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    neovim # editor
    vim
    wget
    kitty # terminal
    git
    git-lfs
    ssh-askpass-fullscreen
    python3
    wl-clipboard
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Max 4 konfigurationer åt taget
  boot.loader.systemd-boot.configurationLimit = 4;
  # Töm gamla sparade efter 7 dagar
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # Do not change!
  system.stateVersion = "25.11"; # Did you read the comment?

}

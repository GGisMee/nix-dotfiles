	{ config, pkgs, ... }:
	let 
	  utils = import ./lib/utils.nix { inherit pkgs;};
	in
	{

	  imports = [
	    ./home # filer i home foldern
	  ];
	  # Home Manager needs a bit of information about you and the paths it should
	  # manage.
	  home.username = "gustav";
	  home.homeDirectory = "/home/gustav";


	  # This value determines the Home Manager release that your configuration is
	  # compatible with. This helps avoid breakage when a new Home Manager release
	  # introduces backwards incompatible changes.
	  #
	  # You should not change this value, even if you update Home Manager. If you do
	  # want to update the value, then make sure to first check the Home Manager
	  # release notes.
	  home.stateVersion = "25.11"; # Please read the comment before changing.

	  # The home.packages option allows you to install Nix packages into your
	  # environment.

	  # Fix for pixelated apps
	  home.sessionVariables = {
	    NIXOS_OZONE_WL = "1";
	    QT_QPA_PLATFORM = "wayland";
	    GDK_BACKEND = "wayland";
      EDITOR = "nvim";
	  };
	  wayland.windowManager.hyprland.settings = {
	    xwayland = {
	      force_zero_scaling = true;
	    };
	  };

	  home.packages = with pkgs; [
	    fuzzel # open app
	    swaynotificationcenter
	    swww
	    waybar

	    brightnessctl
	    grim # screenshots
	    slurp # selecting regions for grim
	    wl-clipboard # copy pasting

	    volantes-cursors

	    obsidian
	    google-chrome

	    vesktop # discord copy

	    (utils.waylandFix vscode "code")

      trash-cli # nice app for handeling trash
      yazi # nice app for file managing

      gemini-cli
 


  ];

  programs.bash.enable = true;

  # programs.niri.enable = true;
  # Fuzzel (Launcher)
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main.terminal = "${pkgs.foot}/bin/foot";
  };



  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gustav/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

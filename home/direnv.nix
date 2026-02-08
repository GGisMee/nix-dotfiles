{ pkgs, ... }: { # Paket som aktiverar venv automatiskt
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # Aktiverar tyst laddning (Lägg kanske till senare)
    config.global.hide_env_diff = true; 
  };
}

{pkgs, config, ...}: 
{
home.packages= with pkgs; [
  neovim
  git
  gcc
  gnumake
  unzip
  ripgrep
  fd
  # LSPs / Formatters
  lua-language-server
  stylua
  nil # Nix LSP

  # Python 
  ruff
  pyright

  # PDF + Matematik
  ghostscript
  tectonic
  
  # simple git tui
  lazygit

  python3Packages.jupytext
  python3Packages.ipykernel
];
home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Projects/lazyvim";
}

{pkgs, config, ...}: 
{
home.packages= with pkgs; [
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
];
home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Projects/lazyvim";
}

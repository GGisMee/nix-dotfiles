{pkgs, ...}: 
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''set nowrap'';
    plugins = with pkgs.vimPlugins; [
	nvim-lspconfig          # LSP
	nvim-treesitter.withAllGrammars # Syntax
	telescope-nvim          # Sök
	catppuccin-nvim         # Tema
    ];
  };
}

{ ... }:
{

  programs.nixvim = {
    enable = true;
    imports = [
      ./gitsigns.nix
      ./telescope.nix
      ./which-key.nix
      ./lsp.nix
      ./conform.nix
      ./blink-cmp.nix
      ./todo-comments.nix
      ./mini.nix
      ./treesitter.nix
      ./web-devicons.nix
      ./neo-tree.nix
    ];
    viAlias = true;
    vimAlias = true;
    waylandSupport = true;

    editorconfig.enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      mouse = "a";
      showmode = false;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      inccommand = "split";
      cursorline = true;
      scrolloff = 10;
      confirm = true;
      hlsearch = true;
    };
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}

{...}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
    };
  };
}

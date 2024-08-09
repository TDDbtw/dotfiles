return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>MM", ":Gitsigns preview_hunk<CR>", {})
      -- vim.keymap.set("n", "<leader>gt", ":Gitsigns preview_hunk<CR>", {})
    end
  }
}


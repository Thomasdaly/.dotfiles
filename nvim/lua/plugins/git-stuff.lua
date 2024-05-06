return {
  {
    "tpope/vim-fugitive",
        config = function ()
            vim.keymap.set("n", "<leader>gs", ":Git<CR>", {desc = "Show git status"})
            vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {desc = "Initiate git commit"})
            vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", {desc = "Initiate git pull"})
            vim.keymap.set("n", "<leader>gP", ":Git push<CR>", {desc = "Initiate git push"})
        end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {desc = "Preview git hunk"})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {desc = "Toggle blame for current line"})
    end
  }
}

return {
    {
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim", -- required
                "sindrets/diffview.nvim", -- optional - Diff integration

                -- Only one of these is needed, not both.
                "ibhagwan/fzf-lua", },
            config = true
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()

            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "preview_hunk" })
            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>",
                { desc = "toggle_current_line_blame" })
        end
    }
}

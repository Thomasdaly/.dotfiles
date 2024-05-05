return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    width = 90,  -- Define the window width
                    options = {}
                },
            }
            require("zen-mode").toggle()  -- Toggle Zen Mode
            vim.wo.wrap = false  -- Disable text wrapping
            vim.wo.number = true  -- Enable line numbers
            vim.wo.rnu = true  -- Enable relative line numbers
        end, { desc = "Toggle Zen Mode (wide)" })  -- Description for which-key

        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").setup {
                window = {
                    width = 80,  -- Define a narrower window width
                    options = {}
                },
            }
            require("zen-mode").toggle()  -- Toggle Zen Mode
            vim.wo.wrap = false  -- Disable text wrapping
            vim.wo.number = false  -- Disable line numbers
            vim.wo.rnu = false  -- Disable relative line numbers
            vim.opt.colorcolumn = "0"  -- Clear the color column
        end, { desc = "Toggle Zen Mode (narrow)" })  -- Description for which-key
    end
}


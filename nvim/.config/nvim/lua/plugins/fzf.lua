return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
        vim.keymap.set("n", "<c-P>", function()
            require('fzf-lua').files()
        end, { silent = true, desc = "File search - fzf-lua" })
        vim.keymap.set("n", "<c-F>", function()
            require('fzf-lua').grep()
        end, { silent = true, desc = "Live grep - fzf-lua" })
        vim.keymap.set("n", "<c-O>", function()
            require('fzf-lua').oldfiles()
        end, { silent = true, desc = "Recent files - fzf-lua" })

    end
}

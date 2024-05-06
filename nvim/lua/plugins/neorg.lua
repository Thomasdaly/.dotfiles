return {
{
    "vhyrro/luarocks.nvim",
    priority = 1000, -- This plugin loads first out of the rest
    config = function()
        require("luarocks-nvim").setup({})  -- Setup luarocks within Neovim
    end
},
{
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" }, -- Neorg depends on luarocks.nvim
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.concealer"] = {},
                ["core.esupports.hop"] = {},
                ["core.integrations.treesitter"] = {},
                ["core.summary"]  = {},
                ["core.dirman"] = { -- Manage Neorg directories
                    config = {
                        workspaces = {
                            personal = "~/notes/personal", -- Path to your personal notes
                            uni = "~/notes/uni" -- Path to your university notes
                        }
                    }
                },
            }
        })
    end,
}
}

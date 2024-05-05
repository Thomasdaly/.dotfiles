return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- Recommended: use the latest release instead of the latest commit.
        lazy = true,
        ft = "markdown",  -- Load the plugin only for Markdown files.
        requires = "nvim-lua/plenary.nvim",  -- Required dependency for obsidian.nvim.
        config = function()
            require("obsidian").setup({
                -- Configuration for workspaces, each corresponding to an Obsidian vault.
                workspaces = {
                    {
                        name = "personal",
                        path = "~/repos/obisidian/Personal",
                    },
                    {
                        name = "work",
                        path = "~/vaults/work",
                        -- Optional configuration specific to the work workspace.
                        overrides = {
                            notes_subdir = "notes",
                        },
                    },
                },

                -- Global settings for Obsidian.
                notes_subdir = "notes",
                log_level = vim.log.levels.INFO,

                -- Configuration for daily notes.
                daily_notes = {
                    folder = "notes/dailies",
                    date_format = "%Y-%m-%d",
                    alias_format = "%B %-d, %Y",
                },

                -- Enable completion for wiki links and tags with nvim-cmp.
                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                },

                -- Key mappings for Obsidian features.
                mappings = {
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                    ["<leader>ch"] = {
                        action = function()
                            return require("obsidian").util.toggle_checkbox()
                        end,
                        opts = { buffer = true },
                    },
                    ["<cr>"] = {
                        action = function()
                            return require("obsidian").util.smart_action()
                        end,
                        opts = { buffer = true, expr = true },
                    },
                },

                -- Additional customization for creating new notes.
                new_notes_location = "notes_subdir",
                note_id_func = function(title)
                    local suffix = ""
                    if title then
                        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                    else
                        for _ = 1, 4 do
                            suffix = suffix .. string.char(math.random(65, 90))
                        end
                    end
                    return tostring(os.time()) .. "-" .. suffix
                end,

                -- How wiki links are formatted.
                wiki_link_func = function(opts)
                    return require("obsidian.util").wiki_link_id_prefix(opts)
                end,
            })
        end
    }
}


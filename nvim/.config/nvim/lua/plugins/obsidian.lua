return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",                      -- Recommended: use the latest release instead of the latest commit.
        lazy = true,
        ft = "markdown",                    -- Load the plugin only for Markdown files.
        requires = "nvim-lua/plenary.nvim", -- Required dependency for obsidian.nvim.
        config = function()
            require("obsidian").setup({
                -- Configuration for workspaces, each corresponding to an Obsidian vault.
                workspaces = {
                    {
                        name = "personal",
                        path = "~/vaults/personal",
                    },
                }, -- Global settings for Obsidian.
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
                ui = {
                    enable = true, -- set to false to disable all additional syntax features
                    update_debounce = 200, -- update delay after a text change (in milliseconds)
                    -- Define how various check-boxes are displayed
                    checkboxes = {
                        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                        ["x"] = { char = "", hl_group = "ObsidianDone" },
                        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                        -- Replace the above with this if you don't have a patched font:
                        -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                        -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                        -- You can also add more custom ones...
                    },
                    -- Use bullet marks for non-checkbox lists.
                    bullets = { char = "•", hl_group = "ObsidianBullet" },
                    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                    -- Replace the above with this if you don't have a patched font:
                    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                    reference_text = { hl_group = "ObsidianRefText" },
                    highlight_text = { hl_group = "ObsidianHighlightText" },
                    tags = { hl_group = "ObsidianTag" },
                    block_ids = { hl_group = "ObsidianBlockID" },
                    hl_groups = {
                        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                        ObsidianTodo = { bold = true, fg = "#f78c6c" },
                        ObsidianDone = { bold = true, fg = "#89ddff" },
                        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                        ObsidianTilde = { bold = true, fg = "#ff5370" },
                        ObsidianBullet = { bold = true, fg = "#89ddff" },
                        ObsidianRefText = { underline = true, fg = "#c792ea" },
                        ObsidianExtLinkIcon = { fg = "#c792ea" },
                        ObsidianTag = { italic = true, fg = "#89ddff" },
                        ObsidianBlockID = { italic = true, fg = "#89ddff" },
                        ObsidianHighlightText = { bg = "#75662e" },
                    },
                },
                -- How wiki links are formatted.
                wiki_link_func = function(opts)
                    return require("obsidian.util").wiki_link_id_prefix(opts)
                end,
            })
        end
    }
}

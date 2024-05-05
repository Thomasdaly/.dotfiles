return {
    "tpope/vim-fugitive",
    cmd = {
        "Gstatus", "Gblame", "Gpush", "Gpull", "Gfetch", "Gdiff", "Glog", "Gmerge", "Gcommit", "Gremove", "Gmove", "Gread", "Gwrite", "Ggrep", "Gbrowse", "Git", "Gedit", "G"
    },
    config = function()
        -- Define the functions for the keymaps
        local functions = {
            Gstatus = function() print("Git status") end,
            Gblame = function() print("Git blame") end,
            Gpush = function() print("Git push") end,
            Gpull = function() print("Git pull") end,
            Gfetch = function() print("Git fetch") end
        }

        -- Set the key mappings
        vim.keymap.set('n', '<leader>gs', ':lua functions.Gstatus()<CR>', {noremap = true, silent = true, description = 'Git status'})
        vim.keymap.set('n', '<leader>gb', ':lua functions.Gblame()<CR>', {noremap = true, silent = true, description = 'Git blame'})
        vim.keymap.set('n', '<leader>gp', ':lua functions.Gpush()<CR>', {noremap = true, silent = true, description = 'Git push'})
        vim.keymap.set('n', '<leader>gl', ':lua functions.Gpull()<CR>', {noremap = true, silent = true, description = 'Git pull'})
        vim.keymap.set('n', '<leader>gf', ':lua functions.Gfetch()<CR>', {noremap = true, silent = true, description = 'Git fetch'})
    end
}

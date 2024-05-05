return {
    "tpope/vim-fugitive",
    cmd = {
        "Gstatus", "Gblame", "Gpush", "Gpull", "Gfetch", "Gdiff", "Glog", "Gmerge", "Gcommit", "Gremove", "Gmove", "Gread", "Gwrite", "Ggrep", "Gbrowse", "Git", "Gedit", "Gsplit", "Gvsplit", "Gtabedit"
    },
    config = function()
        -- your configuration comes here
        vim.api.nvim_set_keymap('n', '<leader>gs', ':Gstatus<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>gb', ':Gblame<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>gp', ':Gpush<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>gl', ':Gpull<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>gf', ':Gfetch<CR>', {noremap = true, silent = true})
    end
}

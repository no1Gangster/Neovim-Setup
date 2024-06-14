vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<Up>', function() print("Use k") end)
vim.keymap.set('n', '<Down>', function() print("Use j") end)
vim.keymap.set('n', '<Left>', function() print("Use h") end)
vim.keymap.set('n', '<Right>', function() print("Use l") end)

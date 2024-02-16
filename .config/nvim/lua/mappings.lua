vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-l>', '<C-W>l')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('n', '<Leader>ww', '<cmd>write<Cr>')

vim.keymap.set('n', '[t', '<cmd>tabprev<Cr>')
vim.keymap.set('n', ']t', '<cmd>tabnext<Cr>')

vim.keymap.set('n', '[q', '<cmd>cp<Cr>zz')
vim.keymap.set('n', ']q', '<cmd>cn<Cr>zz')

vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')

vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.cursorlineopt = 'both'
vim.o.hlsearch = true

vim.o.updatetime = 250
vim.o.timeoutlen = 333

vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus'
vim.g.clipboard = {
    name = 'xsel',
    copy = {
        ['+'] = {'xsel', '--nodetach', '-i', '-b'},
        ['*'] = {'xsel', '--nodetach', '-i', '-p'},
    },
    paste = {
        ['+'] = {'xsel',  '-o', '-b'},
        ['*'] = {'xsel',  '-o', '-b'},
    },
    cache_enabled = 1,
}

vim.o.wrapscan = false

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.wrap = false
vim.o.autoread = false

vim.o.diffopt = 'algorithm:histogram'

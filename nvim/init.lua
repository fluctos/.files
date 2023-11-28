-- TODO:
-- [ ] remove trailing whitespace from lines when saving

vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1

vim.g.leader = ' '
vim.g.mapleader = ' '

require('lazy.lazy')

require('options')
require('autocmds')
require('mappings')

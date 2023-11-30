-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('YankHighlight', {clear = true}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            timeout = 750,
        })
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('RemoveTrailingWhitespace', {clear = true}),
    pattern = {
        '*.c', '*.cpp', '*.h', '*.hpp',
        'CMake*',
        'Makefile',
        '*.rs',
    },
    command = '%s/\\s\\+$//',
})

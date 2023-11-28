-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            timeout = 750,
        })
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', {clear = true}),
    pattern = '*',
})




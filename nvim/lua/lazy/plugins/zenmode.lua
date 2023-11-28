return {
    'folke/zen-mode.nvim',
    config = function()
        require('zen-mode').setup({
            window = {
                backdrop = 0.8,
                width = 0.6,
                height = 1,
                options = {
                    signcolumn = 'no',
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = '0',
                    list = false,
                },
            },
            plugins = {
                options = {
                    enabled = false,
                },
                diagnostics = {
                    enabled = false,
                },
            },
        })

        vim.keymap.set('n', '<Leader>uz', require('zen-mode').toggle)
    end
}

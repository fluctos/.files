return {
    'folke/zen-mode.nvim',
    config = function()
        require('zen-mode').setup({
            zindex = 40,

            window = {
                backdrop = 0.95,
                width = 120,
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
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                },
                twilight = { enabled = true },
                gitsigns = { enabled = false },
                tmux = { enabled = false },
                diagnostics = { enabled = false },
                kitty = {
                    enabled = false,
                    font = "+4",
                },
                alacritty = {
                    enabled = false,
                    font = "14",
                },
                wezterm = {
                    enabled = false,
                    font = "+4",
                },
            },

            on_open = function(_win)
            end,

            on_close = function()
            end,
        })

        vim.keymap.set('n', '<Leader>uz', require('zen-mode').toggle)
    end
}


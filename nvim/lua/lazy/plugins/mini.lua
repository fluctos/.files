return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.move').setup()
        require('mini.pairs').setup()
    end,
}

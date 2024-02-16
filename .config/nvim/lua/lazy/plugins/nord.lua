return {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nord_contrast = false
        vim.g.nord_enable_sidebar_background = false
        vim.g.nord_bold = false
        vim.g.nord_borders = true
        vim.g.nord_disable_background = true
        vim.g.nord_cursorline_transparent = false
        vim.g.nord_italic = false
        vim.g.nord_uniform_diff_background = false
        require('nord').set()
    end,
}


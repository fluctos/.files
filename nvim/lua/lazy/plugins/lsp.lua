return {
    {
        'neovim/nvim-lspconfig',
    },
    {
        'williamboman/mason.nvim',
        dependencies = 'nvim-lspconfig',
        config = function()
            require('mason').setup({
                ui = {border = 'none'},
            })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'mason.nvim',
        },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', },
            })
        end,
    },
}

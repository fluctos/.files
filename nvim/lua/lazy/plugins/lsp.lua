local on_attach = function()
    vim.o.signcolumn = 'yes:1'
    local telescope = require('telescope.builtin')
    vim.keymap.set('n', 'gd', telescope.lsp_definitions)
    vim.keymap.set('n', 'gt', telescope.lsp_type_definitions)
    vim.keymap.set('n', 'gi', telescope.lsp_implementations)
    vim.keymap.set('n', 'gr', telescope.lsp_references)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', '<Leader>cr', vim.lsp.buf.rename)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action)
end

return {
    {
        'williamboman/mason.nvim',
        config = true,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = {
            ensure_installed = {
                'clangd',
                'lua_ls',
            },
        },

    },
    {
        'neovim/nvim-lspconfig',
        dependencies = 'nvim-telescope/telescope.nvim',
        config = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
                on_attach = on_attach
            })
            require('lspconfig').clangd.setup({
                on_attach = on_attach
            })
        end,
    },
}

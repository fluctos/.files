return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },

        config = function()

            vim.diagnostic.config({
                underline = {
                    severity = vim.diagnostic.severity.ERROR,
                },
                update_in_insert = false,
                virtual_text = false,
                severity_sort = true,
            })

            local servers = {
                clangd = {},

                rust_analyzer = {
                    cargo = {
                      allFeatures = true,
                      loadOutDirsFromCheck = true,
                      runBuildScripts = true,
                    },
                    diagnostics = {
                        enable = true,
                        experimental = {
                            enable = true,
                        },
                    },
                },

                lua_ls = {
                    Lua = {
                        diagnostics = {globals = {'vim'}},
                        workspace = {checkThirdParty = false},
                        telementry = {enable = false},
                    },
                }
            }

            local on_attach = function(event)
                vim.o.signcolumn = 'yes:1'
                local telescope = require('telescope.builtin')
                vim.keymap.set('n', 'gd', telescope.lsp_definitions)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
                vim.keymap.set('n', 'gt', telescope.lsp_type_definitions)
                vim.keymap.set('n', 'gi', telescope.lsp_implementations)
                vim.keymap.set('n', 'gr', telescope.lsp_references)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover)
                vim.keymap.set('n', '<Leader>cr', vim.lsp.buf.rename)
                vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action)
                vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            end

            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = vim.tbl_keys(servers)
            })

            require('mason-lspconfig').setup_handlers({
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = vim.lsp.protocol.make_client_capabilities(),
                        on_attach = on_attach,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    })
                end,
            })
        end,
    },
}

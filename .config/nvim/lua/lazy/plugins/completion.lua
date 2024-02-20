return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },

        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            cmp.setup({
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                }, {
                    { name = 'luasnip' },
                    { name = 'buffer' },
                }),

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
            })
        end,
    },
}

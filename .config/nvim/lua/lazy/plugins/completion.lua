
return {
    {
        'hrsh7th/nvim-cmp',

        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'github/copilot.vim'
        },

        config = function()
            local cmp = require('cmp')

            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true

            cmp.setup({

                completion = {
                    completeopt = 'menu,menuone,noselect',
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),

                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),

                    ['<Tab>'] = cmp.mapping(
                        function(fallback)
                            if cmp.visible() then
                                cmp.confirm({
                                    behavior = cmp.ConfirmBehavior.Insert,
                                    select = true,
                                })
                            elseif vim.b._copilot_suggestion ~= nil then
                                vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
                            else
                                fallback()
                            end
                        end,
                        {'i', 's'}
                    ),
                }),

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                }),

            })
        end,
    },
}

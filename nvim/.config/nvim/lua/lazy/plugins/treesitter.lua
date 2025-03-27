return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            sync_install = false,
            auto_install = true,
            ensure_installed = {},
            parser_install_dir = nil,
            ignore_install = {},
            modules = {
                highlight = {
                    custom_captures = {},
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = false,
                    keymaps = {
                        init_selection = 'gnn',
                        node_incremental = 'grn',
                        scope_incremental = 'grc',
                        node_decremental = 'grm',
                    },
                },
                indent = {
                    enable = false,
                },
            },
        })
    end,
}

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        {'debugloop/telescope-undo.nvim'},
    },
    config = function()
        telescope = require('telescope')

        telescope.setup({
            defaults = {
                sorting_strategy = 'ascending',
                layout_strategy = 'vertical',
                layout_config = {
                    anchor = 'center',
                    height = 0.9,
                    mirror = true,
                    prompt_position = 'top',
                    scroll_speed = 1,
                    width = 0.9,
                    preview_cutoff = 0,
                    preview_height = 0.5,
                }
            },
            extensions = {
                undo = {
                    mappings = {
                        i = {
                            ['<cr>'] = require('telescope-undo.actions').restore,
                            ['<C-cr>'] = require('telescope-undo.actions').restore,
                        },
                        n = {
                            ['<cr>'] = require('telescope-undo.actions').restore,
                            ['<C-cr>'] = require('telescope-undo.actions').restore,
                        },
                    },
                },
            },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('undo')

        vim.keymap.set('n', '\\\\', require('telescope.builtin').resume)

        vim.keymap.set('n', '\\b', require('telescope.builtin').buffers)
        vim.keymap.set('n', '\\d', require('telescope.builtin').diagnostics)
        vim.keymap.set('n', '\\f', require('telescope.builtin').find_files)
        vim.keymap.set('n', '\\g', require('telescope.builtin').git_files)
        vim.keymap.set('n', '\\h', require('telescope.builtin').help_tags)
        vim.keymap.set('n', '\\o', require('telescope.builtin').oldfiles)
        vim.keymap.set('n', '\\r', require('telescope.builtin').registers)
        vim.keymap.set('n', '\\s', require('telescope.builtin').live_grep)
        vim.keymap.set('n', '\\t', require('telescope.builtin').builtin)
        vim.keymap.set('n', '\\w', require('telescope.builtin').grep_string)
        
        vim.keymap.set('n', '<Leader><BS>', require('telescope').extensions.undo.undo)

        browse_files = function(path, title)
            require('telescope.builtin').find_files({
                shorten_path = true,
                cwd = path,
                prompt_title = title
            })
        end

        vim.keymap.set('n', '<Leader>rc', function() browse_files('~/.config/nvim', 'NVIM Config') end, opts)
        vim.keymap.set('n', '<Leader>rs', function() browse_files('~/.local/share/nvim', 'NVIM Data') end, opts)
    end,
}

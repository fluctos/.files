return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        {'debugloop/telescope-undo.nvim'},
    },
    config = function()
        local telescope = require('telescope')

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
            pickers = {
                find_files = {
                    no_hidden = false,
                    no_ignore = true,
                },
            },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('undo')

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '\\\\', builtin.resume)

        vim.keymap.set('n', '\\b', builtin.buffers)
        vim.keymap.set('n', '\\d', builtin.diagnostics)
        vim.keymap.set('n', '\\f', builtin.find_files)
        vim.keymap.set('n', '\\g', builtin.git_files)
        vim.keymap.set('n', '\\h', builtin.help_tags)
        vim.keymap.set('n', '\\o', builtin.oldfiles)
        vim.keymap.set('n', '\\r', builtin.registers)
        vim.keymap.set('n', '\\s', builtin.live_grep)
        vim.keymap.set('n', '\\t', builtin.builtin)
        vim.keymap.set('n', '\\u', require('telescope').extensions.undo.undo)
        vim.keymap.set('n', '\\w', builtin.grep_string)

        local browse_files = function(path, title)
            builtin.find_files({
                shorten_path = true,
                cwd = path,
                prompt_title = title
            })
        end

        vim.keymap.set('n', '<Leader>rc', function() browse_files('~/.config/nvim', 'NVIM Config') end)
        vim.keymap.set('n', '<Leader>rs', function() browse_files('~/.local/share/nvim', 'NVIM Data') end)
    end,
}

local function window_nr()
    return '[' .. vim.api.nvim_win_get_number(0) .. ']'
end

local custom_filename = {
    'filename',
    newfile_status = true,
    path = 1,
    symbols = {
        modified = '[+]',
        readonly = '[-]',
        unnamed  = '[?]',
        newfile  = '[0]',
    }
}

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                section_separators = {left = '▛▞', right = '▞▟'},
                -- section_separators = {left = '▓▒░', right = '░▒▓'},
                -- section_separators = {left = '◤', right = '◢'},
                -- section_separators = {left = '◣', right = '◥'},

                -- component_separators = {left = '╲', right = '╲'},
                component_separators = {left = '', right = ''},
            },
            sections = {
                lualine_b = {window_nr},
                lualine_c = {
                    {'branch', component_separators = {left = '', right = ''}},
                    custom_filename,
                },
            },
            inactive_sections = {
                lualine_b = {window_nr},
                lualine_c = {custom_filename},
                lualine_x = {},
            },
        })
    end,
}

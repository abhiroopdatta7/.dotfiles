return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('telescope').setup {
            pickers = {
                find_files = {
                    theme = "dropdown"
                }
            },
        }
    end,
    keys = {
        -- Open File
        { '<C-o>', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>', desc = 'Open File' },
        { '<leader>fo', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>', desc = 'Open File' },
        -- Search in Files
        { '<C-f>', '<cmd>Telescope live_grep<cr>', desc = 'Search all files' },
        { '<leader>ff', '<cmd>Telescope live_grep<cr>', desc = 'Search all files' },
        -- List files
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'List Open files' },
        -- coomand
        { '<leader>fc', '<cmd>builtin.commands<cr>', desc = 'Builtin commands' },
        
        -- Not sure what it does
        { '<leader>ft', '<cmd>Telescope help_tags<cr>', desc = 'Telescope help_tags' },
    },
}
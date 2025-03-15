return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        -- Open File
        { "<C-o>", "<cmd>Telescope find_files<cr>", desc = "Open File" },
        { "<leader>fo", "<cmd>Telescope find_files<cr>", desc = "Open File" },
        -- Search in Files
        { "<C-S>", "<cmd>Telescope live_grep<cr>", desc = "Search all files" },
        { "<leader>ff", "<cmd>Telescope live_grep<cr>", desc = "Search all files" },
        -- List files
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Open files" },

        -- Not sure what it does
        { "<leader>ft", "<cmd>Telescope help_tags<cr>", desc = "Telescope help_tags" },
    },
}
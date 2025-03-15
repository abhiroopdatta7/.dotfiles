return {
    'nvim-tree/nvim-tree.lua',
    event = "VeryLazy",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { "<C-t>", "<cmd>NvimTreeToggle<cr>", desc = "Tree" },
    },
}
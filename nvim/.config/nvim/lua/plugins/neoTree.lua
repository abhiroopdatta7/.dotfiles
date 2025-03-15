return {
    'nvim-neo-tree/neo-tree.nvim',
    lazy=true,
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { "<C-t>", "<cmd>Neotree toggle<cr>", desc = "Explore" },
        { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explore" },
    },
    opts = {
        window = { position = "right" },
    },
}
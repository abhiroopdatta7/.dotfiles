return {
    'nvim-neo-tree/neo-tree.nvim',
    lazy=true,
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { '<C-t>', '<cmd>Neotree toggle<cr>', desc = 'Explore' },
        { '<leader>fe', '<cmd>Neotree toggle<cr>', desc = 'Explore' },
    },
    opts = {
        window = { position = 'right' },
        filesystem = {
          filtered_items = {
            visible = false, -- hide filtered items on open
            hide_gitignored = true,
            hide_dotfiles = false,
            hide_by_name = {
              ".github",
              ".gitignore",
              "package-lock.json",
              ".changeset",
              ".prettierrc.json",
            },
            never_show = { ".git" },
          },
        },
      },
}
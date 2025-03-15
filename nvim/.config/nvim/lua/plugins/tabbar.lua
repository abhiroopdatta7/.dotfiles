return {
    'romgrk/barbar.nvim',
    lazy = false,
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        animation = true,
        insert_at_start = true,
        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
            -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
            NvimTree = true,
            -- Or, specify the text used for the offset:
            undotree = {
            text = 'undotree',
            align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
            },
            -- Or, specify the event which the sidebar executes when leaving:
            ['neo-tree'] = {event = 'BufWipeout'},
            -- Or, specify all three
            Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
        },
    },
    keys = {
        { "<A-1>",     "<Cmd>BufferGoto 1<CR>",              silent = true, desc = "goto 1" },
        { "<A-2>",     "<Cmd>BufferGoto 2<CR>",              silent = true, desc = "goto 2" },
        { "<A-3>",     "<Cmd>BufferGoto 3<CR>",              silent = true, desc = "goto 3"},
        { "<A-4>",     "<Cmd>BufferGoto 4<CR>",              silent = true, desc = "goto 4" },
        { "<A-5>",     "<Cmd>BufferGoto 5<CR>",              silent = true, desc = "goto 5" },
        { "<A-6>",     "<Cmd>BufferGoto 6<CR>",              silent = true, desc = "goto 6" },
        { "<A-7>",     "<Cmd>BufferGoto 7<CR>",              silent = true, desc = "goto 7" },
        { "<A-8>",     "<Cmd>BufferGoto 8<CR>",              silent = true, desc = "goto 8" },
        { "<A-9>",     "<Cmd>BufferGoto 9<CR>",              silent = true, desc = "goto 9" },
        { "<A-0>",     "<Cmd>BufferLast<CR>",                silent = true, desc = "goto last" },

        { "<Tab>",     "<Cmd>BufferNext<CR>",                silent = true, desc = "Next" },
        { "<S-Tab>",   "<Cmd>BufferPrevious<CR>",            silent = true, desc = "Previous" },
        { "<M-,>",     "<Cmd>BufferMovePrevious<CR>",        silent = true, desc = "move ←" },
        { "<M-.>",     "<Cmd>BufferMoveNext<CR>",            silent = true, desc = "move →" },

        -- Re-order to previous/next

        -- Pin/unpin buffer
        { "<A-p>",     "<Cmd>BufferPin<CR>",                 silent = true, desc = "Pin" },

        -- Goto pinned/unpinned buffer
        --                 :BufferGotoPinned
        --                 :BufferGotoUnpinned

        -- Close buffer
        { "<A-w>",     "<Cmd>BufferClose<CR>",               silent = true, desc = "Close" },

        -- Wipeout buffer
        --                 :BufferWipeout

        -- Close commands
        --                 :BufferCloseAllButCurrent
        --                 :BufferCloseAllButPinned
        --                 :BufferCloseAllButCurrentOrPinned
        --                 :BufferCloseBuffersLeft
        --                 :BufferCloseBuffersRight

        -- Magic buffer-picking mode
        { "<Space>bp",     "<Cmd>BufferPick<CR>",               silent = true, desc = "Pick" },
        { "<Space>bd",   "<Cmd>BufferPickDelete<CR>",           silent = true, desc = "Pick Delete" },

        -- Sort automatically by...
        { "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", silent = true, desc = "order by Buffer Name" },
        { "<Space>bn", "<Cmd>BufferOrderByName<CR>",         silent = true, desc = "order by Name" },
        { "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>",    silent = true, desc = "order by Dir" },
        { "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>",     silent = true, desc = "order by Language" },
        { "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", silent = true, desc = "order by Window no." },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
}

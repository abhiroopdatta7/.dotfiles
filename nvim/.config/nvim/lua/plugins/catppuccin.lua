return {
    'catppuccin/nvim', 
    name = 'catppuccin',
    lazy=true,
    init = function() vim.cmd.colorscheme 'catppuccin-mocha' end,
}
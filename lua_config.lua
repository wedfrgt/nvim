-- fzf
require("fzf-lua").setup{
    winopts = { 
        height = 0.8,
        width = 0.8,
    },
    files = {
        prompt = 'Files❯ ',
    },
    buffers = {
        prompt = 'buffers❯ ',
    },
}


-- lualine
require('lualine').setup {
    options = {
		theme = 'onedark',
        component_separators = { left = '', right = '' },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = '' }, right_padding = 2 } },
		lualine_b = { "filename", "branch", { "diff", colored = true } },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "location", separator = { right = '' }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
    tabline = {
		lualine_a = {
			{
				"buffers",
				separator = { left = "", right = "" },
				right_padding = 2,
				symbols = { alternate_file = "" },
                mode = 2,
                max_legth = vim.o.columns * 2 / 3,
			},
		},
        lualine_c = { "diagnostics" },
        lualine_x = {"os.date('%H:%M')"},
        lualine_y = { { "filename", path = 3,separator = { left = "", right = "" } } },
	},
}

vim.api.nvim_set_keymap("n", "<leader>1", ":LualineBuffersJump 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>2", ":LualineBuffersJump 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>3", ":LualineBuffersJump 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>4", ":LualineBuffersJump 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>5", ":LualineBuffersJump 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>6", ":LualineBuffersJump 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>7", ":LualineBuffersJump 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>8", ":LualineBuffersJump 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>9", ":LualineBuffersJump 9<CR>", {noremap = true, silent = true})

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "lua", "vim", "bash", "cmake", "python", "make", "json" },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
        }
    },

    highlight = { enable = true },
}

vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

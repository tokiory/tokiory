local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
	transparent_background = false,
	term_colors = true,
	styles = {
		comments = "italic",
		conditionals = "italic",
		loops = "NONE",
		functions = "NONE",
		keywords = "bold",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},

	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		coc_nvim = false,
		lsp_trouble = true,
		cmp = true,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = false,
			show_root = false,
			transparent_panel = false,
		},
		neotree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		which_key = false,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = false,
		lightspeed = false,
		ts_rainbow = false,
		hop = false,
		notify = false,
		telekasten = false,
		symbols_outline = true,
	}
})

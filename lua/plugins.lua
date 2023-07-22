local enabled = {}

enabled.core = {
	code_completion = true,
    dap = true,
    formatting = true,
	diagflow = true,
	autopairs = true,
	comment = true,
	leap = true,
	which_key = true,
	gitsigns = true,
	lazygit = true,
	illuminate = true,
	indentline = true,
	neotree = true,
	project = true,
	telescope = true,
	bbye = true,
}

enabled.looks = {
	catppuccin = true,
	tokyonight = true,
	dashboard = true,
	lualine = true,
	twilight = true,
	virt_column = true,
	zen_mode = true,
}

enabled.writing = {
	neorg = true,
}

return enabled

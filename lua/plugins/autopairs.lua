local M = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/nvim-cmp",
			event = {
				"InsertEnter",
				"CmdlineEnter",
			},
		},
	},
}

M.opts = {
	check_ts = true, -- treesitter integration
	disable_filetype = { "TelescopePrompt", "text" },
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'", "<" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
}

function M.config(_, opts)
	local npairs = require("nvim-autopairs")
	local cond = require("nvim-autopairs.conds")
	local Rule = require("nvim-autopairs.rule")

	npairs.setup(opts)

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))

	--    -- Add functionality for angle bracket completion for generics.
	-- local opt = require("nvim-autopairs").config
	-- local basic = require("nvim-autopairs.rules.basic")
	-- local utils = require("nvim-autopairs.utils")
	-- local original_is_close_bracket = utils.is_close_bracket
	-- function utils.is_close_bracket(char)
	-- 	return original_is_close_bracket(char) or char == ">"
	-- end
	--
	-- local bracket = basic.bracket_creator(opt)
	--
	-- npairs.add_rules({
	-- 	bracket("<", ">"):with_pair(cond.before_regex("%a+")),
	-- })
	npairs.add_rules({
		Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(opts)
			return opts.char == ">"
		end),
	})
end

return M

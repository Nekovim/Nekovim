local M = {
	"windwp/nvim-autopairs",
	commit = "0e065d423f9cf649e1d92443c939a4b5073b6768",
	event = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/nvim-cmp",
			commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
			event = {
				"InsertEnter",
				"CmdlineEnter",
			},
		},
	},
}

function M.config()
	local npairs = require("nvim-autopairs")
	local cond = require("nvim-autopairs.conds")
	local Rule = require("nvim-autopairs.rule")

	npairs.setup({
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
	})

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))

    -- Add functionality for angle bracket completion for generics.
	local opt = require("nvim-autopairs").config
	local basic = require("nvim-autopairs.rules.basic")
	local utils = require("nvim-autopairs.utils")
	local original_is_close_bracket = utils.is_close_bracket
	function utils.is_close_bracket(char)
		return original_is_close_bracket(char) or char == ">"
	end

	local bracket = basic.bracket_creator(opt)

	npairs.add_rules({
		bracket("<", ">"):with_pair(cond.before_regex("%a+")),
	})
end

return M

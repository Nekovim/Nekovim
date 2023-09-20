local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  commit = "3b664e8277c36accec37f43414d85a3b64feba5f",
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
  local npairs = require "nvim-autopairs"
  local cond = require "nvim-autopairs.conds"
  local Rule = require "nvim-autopairs.rule"

  npairs.setup(opts)

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})

  npairs.add_rules {
    ---@diagnostic disable-next-line: redefined-local
    Rule("<", ">"):with_pair(cond.before_regex "%a+"):with_move(function(opts)
      return opts.char == ">"
    end),
  }
end

return M

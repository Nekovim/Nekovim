-- Useful functions for writing plugins.
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/nekovim/?.lua"

-- Extra lua functionality.
require("lua-utils")

-- Uesful global functions & tables.
require("globals")

-- Sane Options
require("options")
require("autocommands")

-- Key Mappings
require("mappings.global").set_qol()
require("mappings.global").set_colemak()

-- Plugins
require("Lazy")

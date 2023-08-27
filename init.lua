-- Useful functions for writing plugins.
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nekovim/?.lua"
require("tools.table")
require("globals")

-- Sane Options
require("options")
require("autocommands")

-- Key Mappings
require("mappings.global").set_qol()
require("mappings.global").set_colemak()

-- Plugins
require("Lazy")

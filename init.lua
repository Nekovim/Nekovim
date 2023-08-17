-- Useful functions for writing plugins.
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nekovim/?.lua"
require("globals")

-- Sane Options
require("options")
require("autocommands")

-- Key Mappings
require("mappings").set_qol()
require("mappings").set_colemak()

-- Plugins
require("Lazy")

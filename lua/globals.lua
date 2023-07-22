TablePrint = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.relaod").reload_module(...)
end

ReloadPlugin = function(name)
	RELOAD(name)
	return require(name)
end

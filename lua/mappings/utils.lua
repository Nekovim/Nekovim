local M = {}

M.map_keys = function(mappings, bufnr)
  -- See Which-Key V3 spec for bindings. 
  -- mapping = { 1 = keys, 2 = command, mode = n/i/v/x }
  -- or (the one we avoid)
  -- mapping = { 1 = keys, group = "Group Name" }

  for _, mapping in ipairs(mappings) do
    -- Based on which-key spec.
    if mapping.group == nil then
      vim.keymap.set(mapping.mode, mapping[1], mapping[2], { noremap = true, silent = true, buffer = bufnr})
    end
  end
end

return M

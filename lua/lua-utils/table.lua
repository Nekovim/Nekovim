table.deepcopy = function(obj, seen)
  -- Handle non-tables and previously-seen tables.
  if type(obj) ~= "table" then
    return obj
  end
  if seen and seen[obj] then
    return seen[obj]
  end

  -- New table; mark it as seen an copy recursively.
  local s = seen or {}
  local res = {}
  s[obj] = res
  for k, v in next, obj do
    res[table.deepcopy(k, s)] = table.deepcopy(v, s)
  end
  return setmetatable(res, getmetatable(obj))
end

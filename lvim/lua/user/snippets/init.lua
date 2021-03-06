local ls = require "luasnip"

local snippet = ls.s
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

local shortcut = function(val)
  if type(val) == "string" then
    return { t { val }, i(0) }
  end

  if type(val) == "table" then
    for k, v in ipairs(val) do
      if type(v) == "stirng" then
        val[k] = t { v }
      end
    end
  end

  return val
end

local M = {}

function M.same(index)
  return f(function(args)
    return args[1]
  end, { index })
end

function M.make(tbl)
  local result = {}
  for k, v in pairs(tbl) do
    table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
  end

  return result
end

function M.sameFirstUpper(index)
  return f(function(args)
    local first = string.sub(args[1][1], 1, 1)
    local tail = string.sub(args[1][1], 2)
    return { string.upper(first) .. tail }
  end, { index })
end

return M

local ipairs = ipairs
local print = print
local table = require("table")

module(...)

function each(list, fun)
  for k, v in ipairs(list) do
    if fun(v) then
      break
    end
  end
end

function map(list, fun)
  local new_list = { }
  each(list, function(v)
    table.insert(new_list, fun(v))
  end)
  return new_list
end

function all(list, fun)
  local ret_val = true
  each(list, function(v)
    if not fun(v) then
      ret_val = false
      return true
    end
  end)
  return ret_val
end

function any(list, fun)
  local ret_val = false
  each(list, function(v)
    if fun(v) then
      ret_val = true
      return true
    end
  end)
  return ret_val
end

function include(list, value)
  return any(list, function(v)
  	return v == value
  end)
end

function detect(list, fun)
  local found = { }
  each(list, function(v)
    if fun(v) then
      table.insert(found, v)
    end
  end)
  return found
end

function length(list)
  local count = 0
  each(list, function()
    count = count + 1
  end)
  return count
end
args={...}
print(args[1])
param= parse_url( args[1])
print(param["a"])
print(param["b"])

-- Output:
-- a=1&b=3 1 3

-- Function:
local function parse_url(buf)

local map = {}
local decode = function(s)
s = s:gsub('+', ' ')
s = s:gsub('%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
return s
end
buf:gsub('([^&=]+)=([^&=]*)&?',
function(key, value) map[decode(key)] = decode(value) end)
return map
end
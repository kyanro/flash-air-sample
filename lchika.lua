-- print("start lchika!")

args = {...}
-- print(args[1])

-- param = parse_url(args[1])
-- print(param["color"])

print("{\"test\": 1}")

s, indata = fa.pio(0x1f, 0x02)
sleep(1000)
s, indata = fa.pio(0x1f, 0x04)
sleep(1000)
s, indata = fa.pio(0x1f, 0x08)
sleep(1000)
s, indata = fa.pio(0x1f, 0x00)


-- Function:
-- local function parse_url(buf)
-- 	-- decodedBuf = decode(buf)

-- 	local map = {}
-- 	local decode = function(s)
-- 		s = s:gsub('+', ' ')
-- 		s = s:gsub('%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
-- 		return s
-- 	end
-- 		buf:gsub('([^&=]+)=([^&=]*)&?',
-- 		function(key, value) map[decode(key)] = decode(value) end)
-- 	return map
-- end
local decode = function(s)
	s = s:gsub('+', ' ')
	s = s:gsub('%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
	return s
end

local function parse_url(buf)

	local map = {}
	buf:gsub(
		'([^&=]+)=([^&=]*)&?',
		function(key, value)
			map[decode(key)] = decode(value)
		end
	)
	return map
end


args = {...} --　なんでこれでargsとれる？
param = parse_url(args[1])
rgb = param["rgb"]:gsub("([0-9]+).*$", "%1")
-- print("rgb=" .. rgb)

red = tonumber(rgb:sub(1, 1)) * 2
-- print("red=" .. red) 
green = tonumber(rgb:sub(2, 2)) * 8
-- print("green=" .. green) 
blue = tonumber(rgb:sub(3, 3)) * 4
-- print("blue=" .. blue) 



s, indata = fa.pio(0x1f, red + green + blue)
-- s, indata = fa.pio(0x1f, 0x02)	-- red
-- sleep(1000)
-- s, indata = fa.pio(0x1f, 0x04)  -- blue
-- sleep(1000)
-- s, indata = fa.pio(0x1f, 0x08)	-- green
-- sleep(1000)
-- s, indata = fa.pio(0x1f, 0x00)	-- clear

-- json result
json = {result = "ok", rgb = rgb}
jsonText = cjson.encode(json)
print("HTTP/1.1 200 OK\r")
print("Content-Type: application/json; charset=utf-8\r")
-- print("Content-Length: " .. jsonText:len() .. "\r") -- とりあえず固定値で
print("\r")
print(jsonText)
t = {}
t["test"]  = "1"
t["test2"] = "2"
t["test3"] = "3"

for key, value in pairs(t) do
	print(key .. ":" .. value)
end

t2 = {}

for i = 0, 3 do
	t2[i] = i
end 

for i, value in ipairs(t2) do
	print(i .. ":" .. value)
end

j = 0
while j < 3 do
	print("while" .. j)
	j = j + 1
end

print(j)

if t2[0] == 1 then
	print("true")
else
	print("false")
end



function func(param1, param2, param3)
	return param2, param3, param1
end

p1, p2, p3 = func(1, 2, 3)
print(p1 .. p2 .. p3)


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

local map = parse_url("a=1&b=3")

print(map["a"])
print(map["b"])

local mystring = "teeest"
repl = mystring.gsub(mystring, "es()t", function(match) return "bbb"..match end)
print(repl)

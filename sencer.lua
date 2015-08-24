local MAX_LOOP_COUNT = 10
local INTERVAL_MS = 1000

local currentCount = 0

while currentCount < MAX_LOOP_COUNT do
	s, indata = fa.pio(0x00, 0x00)

	if s == 1 then
		local sw = bit32.band(indata, 0x01)
		local file = io.open("switch.txt", "a")
		file:write(sw .. "\n")
		file:close()
		print(sw)
	else
		print("read error!")
	end

	sleep(1000)
	currentCount = currentCount + 1
	print("loop:" .. currentCount)
end 

print("end script")
for line in io.lines("switch.txt") do
	print("line:" .. line)
end

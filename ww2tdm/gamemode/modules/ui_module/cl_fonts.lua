--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

local minSize = 3
local maxSize = 255

for i = minSize, maxSize do
	surface.CreateFont( "futura_"..i, {
		font = "Futura New Book",
		extended = true,
		size = i,
		weight = 300,
	} )
end

for i = minSize, maxSize do
	surface.CreateFont( "futuraLight_"..i, {
		font = "Futura New Light",
		extended = true,
		size = i,
		weight = 300,
	} )
end

for i = minSize, maxSize do
	surface.CreateFont( "futuraBold_"..i, {
		font = "Futura New Bold",
		extended = true,
		size = i,
		weight = 300,
	} )
end

function F(font, max)
	local BASE_WIDTH = 1600
	local spl = string.Split(font, '_')
	local size = tonumber(spl[2])
	local result = math.Clamp(math.Round(size * (ScrW() / BASE_WIDTH)), 0, maxSize)

	if ScrW() < BASE_WIDTH then
		result = math.Round(result * 0.9)
	end

	if max then
		result = math.Clamp(result, 0, max)
	end

	return spl[1]..'_'..result
end

function surface.GetSize(text, font)
	surface.SetFont(font)

	local wide, height = surface.GetTextSize(text)

	return wide, height
end
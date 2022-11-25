local TS = _G[script.Parent]

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)

local function joinDictionaries(...)
	local out = {}
	for i = 1, select("#", ...) do
		for key, val in pairs(select(i, ...)) do
			if val == Roact.None then
				out[key] = nil
			else
				out[key] = val
			end
		end
	end
	return out
end

return joinDictionaries

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rbxts_include = ReplicatedStorage:FindFirstChild("rbxts_include")
if not rbxts_include then
	rbxts_include = script:FindFirstAncestor("node_modules").Parent
end
local TS = require(rbxts_include.RuntimeLib)

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

local TS = _G[script.Parent]

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)

return Roact.createContext()

local TS = _G[script.Parent]

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)

local Background = require(script.Parent.Background)

return function(target)
	local element = Roact.createElement(Background)
	local handle = Roact.mount(element, target)
	return function()
		Roact.unmount(handle)
	end
end

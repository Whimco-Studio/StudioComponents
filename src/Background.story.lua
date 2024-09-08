local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local Background = require(script.Parent.Background)

return function(target)
	local element = React.createElement(Background)
	local handle = React.mount(element, target)
	return function()
		React.unmount(handle)
	end
end

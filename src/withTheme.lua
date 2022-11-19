local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rbxts_include = ReplicatedStorage:FindFirstChild("rbxts_include")
if not rbxts_include then
	rbxts_include = script:FindFirstAncestor("node_modules").Parent
end
local TS = require(rbxts_include.RuntimeLib)

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)

local ThemeContext = require(script.Parent.ThemeContext)

local StudioThemeProvider = Roact.Component:extend("StudioThemeProvider")
local studioSettings = settings().Studio

function StudioThemeProvider:init()
	self:setState({ studioTheme = studioSettings.Theme })

	self._changed = studioSettings.ThemeChanged:Connect(function()
		self:setState({ studioTheme = studioSettings.Theme })
	end)
end

function StudioThemeProvider:willUnmount()
	self._changed:Disconnect()
end

function StudioThemeProvider:render()
	local render = Roact.oneChild(self.props[Roact.Children])

	return Roact.createElement(ThemeContext.Provider, {
		value = self.state.studioTheme,
	}, {
		Consumer = Roact.createElement(ThemeContext.Consumer, {
			render = render,
		})
	})
end

local function withTheme(render)
	return Roact.createElement(ThemeContext.Consumer, {
		render = function(theme)
			if theme then
				return render(theme)
			else
				return Roact.createElement(StudioThemeProvider, {}, {
					render = render,
				})
			end
		end
	})
end

return withTheme

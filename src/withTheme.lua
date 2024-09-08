local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local ThemeContext = require(script.Parent.ThemeContext)

local StudioThemeProvider = React.Component:extend("StudioThemeProvider")
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
	local render = React.oneChild(self.props[React.Children])

	return React.createElement(ThemeContext.Provider, {
		value = self.state.studioTheme,
	}, {
		Consumer = React.createElement(ThemeContext.Consumer, {
			render = render,
		}),
	})
end

local function withTheme(render)
	return React.createElement(ThemeContext.Consumer, {
		render = function(theme)
			if theme then
				return render(theme)
			else
				return React.createElement(StudioThemeProvider, {}, {
					render = render,
				})
			end
		end,
	})
end

return withTheme

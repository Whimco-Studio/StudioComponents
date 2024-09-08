local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local withTheme = require(script.Parent.withTheme)

local VerticalExpandingList = React.Component:extend("VerticalExpandingList")

VerticalExpandingList.defaultProps = {
	LayoutOrder = 0,
	ZIndex = 0,
	BackgroundTransparency = 0,
	BackgroundColorStyle = Enum.StudioStyleGuideColor.MainBackground,
	BorderSizePixel = 1,
	BorderColorStyle = Enum.StudioStyleGuideColor.Border,
	Padding = 0,
}

function VerticalExpandingList:init()
	self.contentSize, self.setContentSize = React.createBinding(Vector2.new())
end

function VerticalExpandingList:render()
	return withTheme(function(theme)
		return React.createElement("Frame", {
			LayoutOrder = self.props.LayoutOrder,
			ZIndex = self.props.ZIndex,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			Size = self.contentSize:map(function(size)
				return UDim2.new(1, 0, 0, size.y + self.props.BorderSizePixel * 2)
			end),
			BackgroundTransparency = self.props.BackgroundTransparency,
			BackgroundColor3 = theme:GetColor(self.props.BackgroundColorStyle),
			BorderSizePixel = self.props.BorderSizePixel,
			BorderColor3 = theme:GetColor(self.props.BorderColorStyle),
			BorderMode = Enum.BorderMode.Inset,
		}, {
			Layout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, self.props.Padding),
				[React.Change.AbsoluteContentSize] = function(rbx)
					self.setContentSize(rbx.AbsoluteContentSize)
				end,
			}),
			Children = React.createFragment(self.props[React.Children]),
		})
	end)
end

return VerticalExpandingList

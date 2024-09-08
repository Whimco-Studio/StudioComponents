local TS = _G[script.Parent]

local React = TS.import(script, TS.getModule(script, "@rbxts", "react").src)

local VerticalExpandingList = require(script.Parent.VerticalExpandingList)

local CollapsibleSectionHeader = require(script.CollapsibleSectionHeader)
local VerticalCollapsibleSection = React.Component:extend("VerticalCollapsibleSection")

VerticalCollapsibleSection.defaultProps = {
	LayoutOrder = 0,
	ZIndex = 0,
	Collapsed = false,
	HeaderText = "VerticalCollapsibleSection.defaultProps.HeaderText",
	-- OnToggle must exist
}

function VerticalCollapsibleSection:init() end

function VerticalCollapsibleSection:render()
	return React.createElement(VerticalExpandingList, {
		LayoutOrder = self.props.LayoutOrder,
		ZIndex = self.props.ZIndex,
		Padding = 1,
	}, {
		Header = React.createElement(CollapsibleSectionHeader, {
			Text = self.props.HeaderText,
			Collapsed = self.props.Collapsed,
			OnToggled = self.props.OnToggled,
		}),
		Content = not self.props.Collapsed and React.createElement(VerticalExpandingList, {
			LayoutOrder = 1,
			BorderSizePixel = 0,
		}, self.props[React.Children]),
	})
end

return VerticalCollapsibleSection

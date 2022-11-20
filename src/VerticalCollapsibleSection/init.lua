local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rbxts_include = ReplicatedStorage:FindFirstChild("rbxts_include")
if not rbxts_include then
	rbxts_include = script:FindFirstAncestor("node_modules").Parent
end
local TS = require(rbxts_include.RuntimeLib)

local Roact = TS.import(script, TS.getModule(script, "@rbxts", "roact").src)

local VerticalExpandingList = require(script.Parent.VerticalExpandingList)

local CollapsibleSectionHeader = require(script.CollapsibleSectionHeader)
local VerticalCollapsibleSection = Roact.Component:extend("VerticalCollapsibleSection")

VerticalCollapsibleSection.defaultProps = {
	LayoutOrder = 0,
	ZIndex = 0,
	Collapsed = false,
	HeaderText = "VerticalCollapsibleSection.defaultProps.HeaderText",
	-- OnToggle must exist
}

function VerticalCollapsibleSection:init() end

function VerticalCollapsibleSection:render()
	return Roact.createElement(VerticalExpandingList, {
		LayoutOrder = self.props.LayoutOrder,
		ZIndex = self.props.ZIndex,
		Padding = 1,
	}, {
		Header = Roact.createElement(CollapsibleSectionHeader, {
			Text = self.props.HeaderText,
			Collapsed = self.props.Collapsed,
			OnToggled = self.props.OnToggled,
		}),
		Content = not self.props.Collapsed and Roact.createElement(VerticalExpandingList, {
			LayoutOrder = 1,
			BorderSizePixel = 0,
		}, self.props[Roact.Children]),
	})
end

return VerticalCollapsibleSection

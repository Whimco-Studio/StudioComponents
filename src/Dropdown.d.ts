import { Element } from "@rbxts/roact";

type IDropdownProps<T extends string> = {
    Items: T[];
	SelectedItem: string;
    OnItemSelected: (item: T) => void;
    Disabled?: boolean;
    MaxVisibleRows?: number;
    RowHeightTop?: number;
    RowHeightItem?: number;
    Width?: UDim;
	Position?: UDim2;
	AnchorPoint?: Vector2;
	LayoutOrder?: number;
	ZIndex?: number;
}

export const Dropdown: <T extends string>(props: IDropdownProps<T>) => Element

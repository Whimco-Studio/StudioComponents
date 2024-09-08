import { Element } from "@rbxts/react";

type IDropdownProps<T extends string> = {
    Items: T[];
    SelectedItem: string;
    OnItemSelected: (item: T) => void;
    Disabled?: boolean;
    MaxVisibleRows?: number;
    RowHeightTop?: number;
    RowHeightItem?: number;
    Width?: UDim;
} & Partial<Pick<Frame, "Position" | "AnchorPoint" | "LayoutOrder" | "ZIndex">>;

export const Dropdown: <T extends string>(props: IDropdownProps<T>) => Element;

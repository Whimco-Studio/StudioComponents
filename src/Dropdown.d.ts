import { Element } from "@rbxts/roact"

type IDropdownProps<T> = {
    Disabled?: boolean;
    OnItemActivated: (item: T) => void;
    Items: T[];
    MaxVisibleRows?: number;
    RowHeightTop?: number;
    RowHeightItem?: number;
    Width?: UDim;
} & Partial<WritableProperties<Frame>>

export const Dropdown: <T>(props: IDropdownProps<T>) => Element
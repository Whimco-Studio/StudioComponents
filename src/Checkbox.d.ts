import { Element } from "@rbxts/react";

type ICheckboxProps = {
    OnActivated: () => void;
    Disabled?: boolean;
    Value?: boolean | "Indeterminate";
    Label?: string;
    Alignment?: "Left" | "Right";
} & Partial<
    Pick<Frame, "LayoutOrder" | "ZIndex" | "Position"> &
        Pick<TextLabel, "RichText">
>;

export const Checkbox: (props: ICheckboxProps) => Element;

import { Element } from "@rbxts/react";

type IRadioButtonProps = {
    OnActivated: () => void;
    Disabled?: boolean;
    Value?: boolean;
    Label?: string;
} & Partial<Pick<TextButton, "LayoutOrder" | "ZIndex">>;

export const RadioButton: <T>(props: IRadioButtonProps) => Element;

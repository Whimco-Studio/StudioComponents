import { Element } from "@rbxts/roact";

type IRadioButtonProps<T> = {
    OnActivated: () => void;
    Disabled?: boolean;
    Value?: boolean;
    Label?: string;
} & Partial<Pick<TextButton, "LayoutOrder" | "ZIndex">>;

export const RadioButton: <T>(props: IRadioButtonProps<T>) => Element;

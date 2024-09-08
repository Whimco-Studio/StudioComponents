import { Element } from "@rbxts/react";

type ITextInputProps = {
    Disabled?: boolean;
    OnFocused?: () => void;
    OnFocusLost?: (
        text: string,
        enterPressed: boolean,
        inputThatCausedFocusLoss: InputObject
    ) => void;
    OnChanged?: (text: string) => void;
} & Partial<
    Pick<TextLabel, "Size" | "Position" | "LayoutOrder" | "Text"> &
        Pick<TextBox, "AnchorPoint" | "PlaceholderText" | "ClearTextOnFocus">
>;

export const TextInput: (props: ITextInputProps) => Element;

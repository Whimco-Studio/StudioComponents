import { Element } from "@rbxts/roact";

type ITextInputProps = {
  Disabled?: boolean;
  OnFocused?: () => void;
  OnFocusLost?: (
    text: string,
    enterPressed: boolean,
    inputThatCausedFocusLoss: InputObject
  ) => void;
  OnChanged?: (text: string) => void;
} & Partial<WritableProperties<TextBox>>;

export const TextInput: (props: ITextInputProps) => Element;

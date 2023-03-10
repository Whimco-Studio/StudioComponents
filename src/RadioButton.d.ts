import { Element } from "@rbxts/roact";

type IRadioButtonProps<T> = {
  Disabled?: boolean;
  Value?: boolean;
  Label?: string;
} & Partial<WritableProperties<TextButton>>;

export const RadioButton: <T>(props: IRadioButtonProps<T>) => Element;

import { Element } from "@rbxts/roact";

type ICheckboxProps = {
  Disabled?: boolean;
  Value?: boolean;
  Label: string;
  RichText?: boolean;
  OnActivated?: () => void;
} & Partial<WritableProperties<Frame>>;

export const Checkbox: (props: ICheckboxProps) => Element;

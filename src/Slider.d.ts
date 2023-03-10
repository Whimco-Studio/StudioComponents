import { Element } from "@rbxts/roact";

type ISliderProps = {
  Max: number;
  Min: number;
  Step: number;
  Value: number;
  OnChange: (value: number) => void;
  Disabled?: boolean;
  Background?: Element;
} & Partial<WritableProperties<Frame>>;

export const Slider: (props: ISliderProps) => Element;

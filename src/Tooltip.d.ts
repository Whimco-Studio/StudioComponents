import { Element } from "@rbxts/roact";

type ITooltipProps = {
  Text: string;
  MaxWidth?: number;
  HoverDelay?: number;
} & Partial<WritableProperties<Frame>>;

export const Tooltip: (props: ITooltipProps) => Element;

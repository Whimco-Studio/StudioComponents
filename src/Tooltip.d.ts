import { Element } from "@rbxts/roact";

type ITooltipProps = {
  Disabled?: boolean;
  Text?: string;
  MaxWidth?: number;
  HoverDelay?: number;
};

export const Tooltip: (props: ITooltipProps) => Element;

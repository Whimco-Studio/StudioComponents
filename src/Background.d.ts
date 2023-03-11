import { Element } from "@rbxts/roact";

type IBackgroundProps = Partial<
  Pick<Frame, "Size" | "Position" | "AnchorPoint" | "LayoutOrder" | "ZIndex">
>;

export const Background: (props: IBackgroundProps) => Element;

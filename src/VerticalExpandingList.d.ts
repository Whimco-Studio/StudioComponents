import { Element } from "@rbxts/roact";

type IVerticalExpandingListProps = {
  LayoutOrder?: number;
  ZIndex?: number;
  BackgroundTransparency?: number;
  BackgroundColorStyle?: Enum.StudioStyleGuideColor;
  BorderSizePixel?: number;
  BorderColorStyle?: Enum.StudioStyleGuideColor;
  Padding?: number;
} & Partial<WritableProperties<Frame>>;

export const VerticalExpandingList: (
  props: IVerticalExpandingListProps
) => Element;

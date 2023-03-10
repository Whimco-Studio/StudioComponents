import { Element } from "@rbxts/roact";

type DefaultLayout = {
  ClassName: string;
  SortOrder: Enum.SortOrder.LayoutOrder;
};

type IScrollFrame = {
  Disabled?: false;
  ScrollingDirection?: Enum.ScrollingDirection.Y;
  BorderSizePixel?: number;
  LayoutOrder?: number;
  ZIndex?: number;
  OnScrolled?: (vector: Vector2) => void;
  Layout?: DefaultLayout;
} & Partial<WritableProperties<Frame>>;

export const ScrollFrame: (props: IScrollFrame) => Element;

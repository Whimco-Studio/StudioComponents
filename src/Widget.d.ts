import { Element } from "@rbxts/roact";

type IWidgetProps = {
  Title: string;
  Name: string;
  InitialDockState?: Enum.InitialDockState;
  FloatingWindowSize?: Vector2;
  MinimumWindowSize?: Vector2;
  OnClosed?: () => void;
} & Partial<WritableProperties<Frame>>;

export const Widget: (props: IWidgetProps) => Element;

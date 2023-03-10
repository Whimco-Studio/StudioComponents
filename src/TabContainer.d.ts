import { Element } from "@rbxts/roact";

export type ITab = {
  Name: string;
  Disabled: boolean;
};

type ITabContainerProps<T extends readonly ITab[]> = {
  Tabs: T;
  OnTabSelected: (tab: T[number]["Name"]) => void;
} & Partial<WritableProperties<Frame>>;

export const TabContainer: <T extends readonly ITab[]>(
  props: ITabContainerProps<T>
) => Element;

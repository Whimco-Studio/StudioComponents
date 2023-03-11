import { Element } from "@rbxts/roact";

type IVerticalExpandingListProps = Partial<
    {
        Padding: number;
        BorderColorStyle: Enum.StudioStyleGuideColor;
        BackgroundColorStyle: Enum.StudioStyleGuideColor;
    } & Pick<
        Frame,
        "LayoutOrder" | "ZIndex" | "BorderSizePixel" | "BackgroundTransparency"
    >
>;

export const VerticalExpandingList: (
    props: IVerticalExpandingListProps
) => Element;

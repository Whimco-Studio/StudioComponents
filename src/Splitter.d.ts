import { Element } from "@rbxts/roact"

type ISplitterProps<T> = {
    Disabled?: boolean,
	Size?: UDim2,
    MinAlpha?: number,
	MaxAlpha?: number,
    Orientation?: "Horizontal" | "Vertical",
    OnAlphaChanged: (alpha: number) => void,
} & Partial<WritableProperties<Frame>>

export const Splitter: <T>(props: ISplitterProps<T>) => Element
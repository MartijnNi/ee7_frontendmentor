export type IconfontId =
  | "box-weight";

export type IconfontKey =
  | "BoxWeight";

export enum Iconfont {
  BoxWeight = "box-weight",
}

export const ICONFONT_CODEPOINTS: { [key in Iconfont]: string } = {
  [Iconfont.BoxWeight]: "61697",
};

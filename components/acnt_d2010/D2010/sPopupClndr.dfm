object sPopupCalendar: TsPopupCalendar
  Tag = 256
  Left = 512
  Top = 268
  BorderStyle = bsNone
  Caption = 'Mgn'
  ClientHeight = 132
  ClientWidth = 189
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sMonthCalendar1: TsMonthCalendar
    Left = 0
    Top = 0
    Width = 189
    Height = 132
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 1
    BorderWidth = 3
    Caption = ' '
    TabOrder = 0
  end
end

object FrontEd: TFrontEd
  Left = 0
  Top = 0
  Caption = 'Front-editor'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 144
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Menu: TMainMenu
    Left = 8
    Top = 8
    object MenuFile: TMenuItem
      Caption = '&File'
      object MenuExit: TMenuItem
        Caption = 'Exit'
      end
    end
    object MenuAbout: TMenuItem
      Caption = '&About'
      object MenuSupport: TMenuItem
        Caption = 'Support'
      end
    end
  end
end

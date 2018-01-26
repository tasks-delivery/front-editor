object Main: TMain
  Left = 210
  Top = 144
  Caption = 'Front-Editor'
  ClientHeight = 985
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Tree: TMemo
    AlignWithMargins = True
    Left = 8
    Top = 0
    Width = 225
    Height = 800
    Color = cl3DDkShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Editor: TRichEdit
    Left = 248
    Top = 0
    Width = 700
    Height = 800
    TabOrder = 1
    OnChange = EditorChange
  end
  object RichEdit1: TRichEdit
    Left = 112
    Top = 856
    Width = 185
    Height = 89
    Lines.Strings = (
      'RichEdit1')
    TabOrder = 2
    OnChange = RichEdit1Change
  end
  object MainMenu1: TMainMenu
    object MenuFile: TMenuItem
      Caption = '&File'
      object OpenProject: TMenuItem
        Caption = 'Open'
        OnClick = OpenProjectClick
      end
      object SaveProject: TMenuItem
        Caption = 'Save'
        OnClick = SaveProjectClick
      end
      object CloseApp: TMenuItem
        Caption = 'Exit'
      end
      object est1: TMenuItem
        Caption = 'Test'
      end
    end
    object MenuAbout: TMenuItem
      Caption = '&About'
    end
  end
  object OpenFile: TOpenDialog
    FileName = 
      'C:\Users\User\Downloads\FM\front-editor-master\front-editor\zona' +
      '.txt'
    Filter = 'All|*.*'
    FilterIndex = 0
    Title = 'Open file'
    Left = 24
  end
  object SaveFile: TSaveDialog
    Filter = 'All|*.*'
    Title = 'Save file'
    Left = 56
  end
end

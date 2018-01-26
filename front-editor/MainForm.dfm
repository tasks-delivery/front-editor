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
  object Editor: TRichEdit
    AlignWithMargins = True
    Left = 251
    Top = -5
    Width = 1000
    Height = 800
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 10
    Margins.Bottom = 10
    Color = cl3DDkShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Constraints.MaxHeight = 2000
    Constraints.MaxWidth = 20000
    Constraints.MinHeight = 200
    Constraints.MinWidth = 200
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
    OnChange = EditorChange
  end
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
    TabOrder = 1
  end
  object TreeView1: TTreeView
    Left = 40
    Top = 832
    Width = 121
    Height = 97
    Indent = 19
    TabOrder = 2
    Items.NodeData = {
      0101000000250000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000666006F006C00640065007200}
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
        OnClick = CloseAppClick
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
  object Timer1: TTimer
    Interval = 2000
    Left = 360
    Top = 840
  end
end

object Main: TMain
  Left = 210
  Top = 144
  Caption = 'Front-Editor'
  ClientHeight = 277
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Editor: TMemo
    Left = 240
    Top = 0
    Width = 361
    Height = 257
    Color = cl3DDkShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Ed')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    WantTabs = True
  end
  object Tree: TMemo
    Left = 0
    Top = 0
    Width = 225
    Height = 257
    Color = clInfoBk
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 1
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
    end
    object MenuAbout: TMenuItem
      Caption = '&About'
    end
  end
  object OpenFile: TOpenDialog
    FileName = 
      'C:\Users\User\Downloads\FM\front-editor-master\front-editor\zona' +
      '.txt'
    Filter = '|*.html, *.htm, *.css, *.jsp'
    FilterIndex = 0
    Title = 'Open file'
    Left = 24
  end
  object SaveFile: TSaveDialog
    Filter = '|*.html, *.htm, *.css, *.jsp'
    Title = 'Save file'
    Left = 56
  end
end

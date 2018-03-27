object CodeStyleWin: TCodeStyleWin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Code style'
  ClientHeight = 291
  ClientWidth = 1026
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object LabelStyle: TLabel
    Left = 8
    Top = 13
    Width = 51
    Height = 13
    Caption = 'Code style'
  end
  object CodeStyleArea: TSynEdit
    Left = 120
    Top = 16
    Width = 900
    Height = 267
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Lines.UnicodeStrings = ''
    ScrollBars = ssNone
    FontSmoothing = fsmNone
  end
  object ComboBoxStyle: TComboBox
    Left = 8
    Top = 32
    Width = 106
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'HTML'
    OnSelect = ComboBoxStyleSelect
  end
  object HtmlStyle: TSynHTMLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 248
    Top = 88
  end
  object JavaStyle: TSynJavaSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clGray
    KeyAttri.Foreground = clBlue
    Left = 288
    Top = 88
  end
  object CssStyle: TSynCssSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 288
    Top = 120
  end
  object JSStyle: TSynJScriptSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    CommentAttri.Foreground = clGray
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clBlue
    StringAttri.Foreground = clGreen
    Left = 248
    Top = 120
  end
  object XmlStyle: TSynXMLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    ElementAttri.Foreground = clBlue
    WantBracesParsed = False
    Left = 248
    Top = 160
  end
  object SqlStyle: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    ConditionalCommentAttri.Foreground = clGray
    IdentifierAttri.Foreground = clPurple
    KeyAttri.Foreground = clBlue
    Left = 288
    Top = 160
  end
end

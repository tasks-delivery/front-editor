object WordsParamsEditor: TWordsParamsEditor
  Left = 301
  Top = 356
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'WordsParamsEditor'
  ClientHeight = 246
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 6
    Top = 6
    Width = 543
    Height = 234
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 8
      Width = 209
      Height = 13
      Caption = #1053#1072#1073#1086#1088' '#1089#1083#1086#1074' (, - '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1089#1083#1086#1074'):'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object bvlMain: TBevel
      Left = 239
      Top = 193
      Width = 274
      Height = 6
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 240
      Top = 15
      Width = 190
      Height = 13
      Caption = #1062#1074#1077#1090' '#1089#1083#1086#1074' '#1080#1079' '#1091#1082#1072#1079#1072#1085#1085#1086#1081' '#1089#1090#1088#1086#1082#1080':'
    end
    object Bevel1: TBevel
      Left = 240
      Top = 40
      Width = 273
      Height = 9
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 249
      Top = 33
      Width = 39
      Height = 13
      Caption = #1064#1088#1080#1092#1090
    end
    object Bevel2: TBevel
      Left = 241
      Top = 72
      Width = 272
      Height = 9
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 249
      Top = 163
      Width = 235
      Height = 26
      Caption = #1052#1077#1089#1090#1086' '#1076#1083#1103' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074#13#10'('#1074' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1074#1077#1088#1089#1080#1080')'
    end
    object btnYes: TButton
      Left = 352
      Top = 201
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 3
    end
    object btnCancel: TButton
      Left = 440
      Top = 201
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 4
    end
    object memMain: TMemo
      Left = 11
      Top = 27
      Width = 220
      Height = 197
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fghfghfgh'
      Font.Style = []
      HideSelection = False
      ParentFont = False
      ScrollBars = ssHorizontal
      TabOrder = 0
      OnChange = memMainChange
      OnClick = memMainChange
      OnKeyUp = memMainKeyUp
    end
    object chkBoxB: TCheckBox
      Left = 243
      Top = 142
      Width = 277
      Height = 17
      Caption = #1053#1072#1095#1080#1085#1072#1103' '#1089' '#1101#1090#1086#1075#1086' '#1089#1083#1086#1074#1072' '#1074#1099#1076#1077#1083#1103#1090#1100' '#1073#1083#1086#1082' '#1089#1083#1086#1074
      TabOrder = 2
      Visible = False
      OnClick = chkBoxBClick
    end
    object edtColor: TEdit
      Left = 432
      Top = 13
      Width = 19
      Height = 21
      TabStop = False
      Color = clBlack
      ReadOnly = True
      TabOrder = 5
    end
    object btnChangeColor: TButton
      Left = 454
      Top = 10
      Width = 59
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnChangeColorClick
    end
    object rbtnGeneral: TRadioButton
      Left = 248
      Top = 48
      Width = 97
      Height = 17
      Caption = #1054#1073#1099#1095#1085#1099#1081
      Checked = True
      TabOrder = 6
      TabStop = True
      OnClick = rbtnGeneralClick
    end
    object rbtnGirn: TRadioButton
      Left = 360
      Top = 48
      Width = 113
      Height = 17
      Caption = #1046#1080#1088#1085#1099#1081
      TabOrder = 7
      OnClick = rbtnGirnClick
    end
    object chkLScob: TCheckBox
      Left = 243
      Top = 78
      Width = 294
      Height = 17
      Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1087#1088#1080' '#1074#1089#1090#1088#1077#1095#1077' '#1089#1080#1084#1074#1086#1083#1072' "(" '#1074' '#1085#1072#1095#1072#1083#1077
      TabOrder = 8
      OnClick = chkLScobClick
    end
    object chkRScob: TCheckBox
      Left = 243
      Top = 99
      Width = 294
      Height = 17
      Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1087#1088#1080' '#1074#1089#1090#1088#1077#1095#1077' '#1089#1080#1084#1074#1086#1083#1072' ")" '#1074' '#1082#1086#1085#1094#1077
      TabOrder = 9
      OnClick = chkRScobClick
    end
  end
  object chkRazdel: TCheckBox
    Left = 249
    Top = 126
    Width = 272
    Height = 17
    Caption = #1042#1099#1076#1077#1083#1077#1085#1080#1077' '#1074' '#1089#1090#1088#1086#1082#1077' '#1087#1086#1089#1083#1077' '#1074#1089#1090#1088#1077#1095#1080' '#1089#1083#1086#1074#1072
    TabOrder = 1
    Visible = False
    OnClick = chkRazdelClick
  end
  object cdlMain: TColorDialog
    Left = 206
    Top = 166
  end
end

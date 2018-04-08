object UpdateApp: TUpdateApp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Update'
  ClientHeight = 291
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object LabelAppVersion: TLabel
    Left = 40
    Top = 62
    Width = 3
    Height = 13
    Visible = False
    OnMouseMove = LabelAppVersionMouseMove
    OnMouseLeave = LabelAppVersionMouseLeave
  end
  object ReleaseHistory: TRichEdit
    Left = 40
    Top = 104
    Width = 353
    Height = 129
    Lines.Strings = (
      'Release 0.1.0'
      ''
      'Released 08.04.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.1' +
        '.0'
      '_____________________________________________________'
      ''
      'Release 0.0.9'
      ''
      'Released 01.04.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.9'
      '_____________________________________________________'
      ''
      'Release 0.0.8'
      ''
      'Released 26.03.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.8'
      '_____________________________________________________'
      ''
      'Release 0.0.7'
      ''
      'Released 18.03.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.7'
      '_______________________________________________________'
      ''
      'Release 0.0.6'
      ''
      'Released 11.03.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.6'
      '_______________________________________________________'
      ''
      'Release 0.0.5.1'
      ''
      'Released 04.03.2018'
      ''
      'https://github.com/tasks-delivery/front-'
      'editor/releases/tag/v0.0.5.1'
      '_______________________________________________________'
      ''
      'Release 0.0.4'
      ''
      'Released 01.03.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.4'
      '_______________________________________________________'
      ''
      'Release 0.0.3'
      ''
      'Released 18.02.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.3'
      '_______________________________________________________'
      ''
      'Release 0.0.2'
      ''
      'Released 11.02.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.2'
      '_______________________________________________________'
      ''
      'Release 0.0.1'
      ''
      'Released 28.01.2018'
      ''
      
        'https://github.com/tasks-delivery/front-editor/releases/tag/v0.0' +
        '.1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object DownloadApp: TButton
    Left = 318
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Download'
    Enabled = False
    TabOrder = 1
    OnClick = DownloadAppClick
  end
  object CheckBoxOffNoti: TCheckBox
    Left = 40
    Top = 256
    Width = 217
    Height = 17
    Caption = 'Turn off application update notification'
    TabOrder = 2
  end
end

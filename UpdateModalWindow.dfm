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
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelAppVersion: TLabel
    Left = 238
    Top = 53
    Width = 155
    Height = 13
    Caption = 'Version 0.0.7 has been released'
    OnMouseMove = LabelAppVersionMouseMove
    OnMouseLeave = LabelAppVersionMouseLeave
  end
  object ReleaseHistory: TRichEdit
    Left = 40
    Top = 128
    Width = 353
    Height = 129
    Lines.Strings = (
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
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Download'
    TabOrder = 1
    OnClick = DownloadAppClick
  end
end

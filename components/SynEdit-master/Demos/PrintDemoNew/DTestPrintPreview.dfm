object TestPrintPreviewDlg: TTestPrintPreviewDlg
  Left = 192
  Top = 148
  Width = 516
  Height = 420
  Caption = 'Print Preview'
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 508
    Height = 23
    AutoSize = True
    ButtonHeight = 23
    ButtonWidth = 24
    Caption = 'ToolBar1'
    EdgeBorders = []
    Flat = True
    Images = ImageList
    Indent = 5
    TabOrder = 0
    object FirstBtn: TToolButton
      Left = 5
      Top = 0
      Action = FirstCmd
      ParentShowHint = False
      ShowHint = True
    end
    object PrevBtn: TToolButton
      Left = 29
      Top = 0
      Action = PrevCmd
      ParentShowHint = False
      ShowHint = True
    end
    object NextBtn: TToolButton
      Left = 53
      Top = 0
      Action = NextCmd
      ParentShowHint = False
      ShowHint = True
    end
    object LastBtn: TToolButton
      Left = 77
      Top = 0
      Action = LastCmd
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton1: TToolButton
      Left = 101
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 109
      Top = 0
      Action = ZoomCmd
      DropdownMenu = PopupMenu1
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
    end
    object ToolButton5: TToolButton
      Left = 146
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object PrintBtn: TToolButton
      Left = 154
      Top = 0
      Action = PrintCmd
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton4: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object CloseBtn: TToolButton
      Left = 186
      Top = 0
      Action = CloseCmd
      ParentShowHint = False
      ShowHint = True
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 367
    Width = 508
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 100
      end>
  end
  object SynEditPrintPreview: TSynEditPrintPreview
    Left = 0
    Top = 23
    Width = 508
    Height = 344
    ScaleMode = pscWholePage
    OnMouseDown = SynEditPrintPreviewMouseDown
    OnPreviewPage = SynEditPrintPreviewPreviewPage
  end
  object ImageList: TImageList
    Height = 17
    Width = 17
    Left = 242
    Top = 174
    Bitmap = {
      494C010107000900040011001100FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000440000002200000001002000000000002024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000008080008000000000000000000000000000
      0000000000000000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000080
      8000008080008000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000008080000080800000808000800000000000
      0000000000000000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000080
      8000008080000080800080000000FFFFFF000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF0000000000FFFFFF0000000000FFFFFF008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008000000000808000008080000080800080000000FFFF
      FF00FFFFFF000000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000FFFFFF0000000000FFFFFF0080000000FFFFFF000000
      0000FFFFFF008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000080
      8000008080000080800080000000FFFFFF00FFFFFF00FFFFFF00800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000FFFF
      FF00000000008000000000000000FFFFFF000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000008000000000808000008080000080800080000000FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000FFFFFF00800000008000000080000000800000008000
      0000FFFFFF008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000080
      8000008080000080800080000000FFFFFF00FFFFFF00FFFFFF00800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000000000FFFF
      FF00000000008000000000000000FFFFFF000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000008000000000808000008080000080800080000000FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800080808000FFFFFF0000000000FFFFFF0080000000FFFFFF000000
      0000FFFFFF008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000080
      8000008080000080800080000000FFFFFF00FFFFFF00FFFFFF00800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF0000000000FFFFFF0000000000FFFFFF008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000008000000000808000008080000080800080000000FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000000000000000000000000
      0000000000000000000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000044000000220000000100010000000000980100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFE00000000000FFFCFFFF
      FFFFE00000000000FFF8E003FFFFE00000000000FFF1DFF5C0FC000000000000
      FFE38002FC7DE00000000000FFC7BF18FC3DE00000000000E08FBF1AFC1DE000
      00000000C01F80037C0DE000000000008A3FBFF57C05E00000000000111FC00A
      7C01E000000000002A9FE0057C01E00000000000001FF000FC01E00000000000
      2A9FF003FC01E00000000000111FF803FC01E000000000008A3FF801FC01E000
      00000000C07FFC01FC01E00000000000E0FFFFFFFFFFE00000000000FFFFFFFF
      FFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000
      FBEFFFEFFF7FFF7DF0000000FBCFFFCFFF3FFF3DF0000000FB8FFF8FFF1FFF1D
      F0000000FB0FFF0FFF0FFF0DF0000000FA0FFE0FFF07FF05F0000000F80FFC0F
      FF03FF01F0000000FA0FFE0FFF07FF05F0000000FB0FFF0FFF0FFF0DF0000000
      FB8FFF8FFF1FFF1DF0000000FBCFFFCFFF3FFF3DF0000000FBEFFFEFFF7FFF7D
      F0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFF
      FFFFFFFFF000000000000000000000000000000000000000000000000000}
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 272
    Top = 175
    object FirstCmd: TAction
      Caption = 'FirstCmd'
      Hint = 'First|Go to first page'
      ImageIndex = 0
      ShortCut = 32838
      OnExecute = FirstCmdExecute
    end
    object PrevCmd: TAction
      Caption = 'PrevCmd'
      Hint = 'Previous|Go to previous page'
      ImageIndex = 1
      ShortCut = 32848
      OnExecute = PrevCmdExecute
    end
    object NextCmd: TAction
      Caption = 'NextCmd'
      Hint = 'Next|Go to next page'
      ImageIndex = 2
      ShortCut = 32846
      OnExecute = NextCmdExecute
    end
    object LastCmd: TAction
      Caption = 'LastCmd'
      Hint = 'Last|Go to last page'
      ImageIndex = 3
      ShortCut = 32844
      OnExecute = LastCmdExecute
    end
    object ZoomCmd: TAction
      Caption = 'FitCmd'
      Hint = 'Zoom|Zoom In/Out'
      ImageIndex = 4
      ShortCut = 32858
      OnExecute = ZoomCmdExecute
    end
    object PrintCmd: TAction
      Caption = 'PrintCmd'
      Hint = 'Print|Print the document'
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = PrintCmdExecute
    end
    object CloseCmd: TAction
      Caption = 'CloseCmd'
      Hint = 'Close|Close Print Preview'
      ImageIndex = 6
      ShortCut = 32835
      OnExecute = CloseCmdExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 180
    Top = 65
    object Fitto1: TMenuItem
      Tag = -1
      Caption = 'Whole page'
      OnClick = Fitto1Click
    end
    object Pagewidth1: TMenuItem
      Tag = -2
      Caption = 'Page width'
      OnClick = Fitto1Click
    end
    object N1: TMenuItem
      Caption = '-'
      OnClick = Fitto1Click
    end
    object N251: TMenuItem
      Tag = 25
      Caption = '25%'
      OnClick = Fitto1Click
    end
    object N501: TMenuItem
      Tag = 50
      Caption = '50%'
      OnClick = Fitto1Click
    end
    object N1001: TMenuItem
      Tag = 100
      Caption = '100%'
      OnClick = Fitto1Click
    end
    object N2001: TMenuItem
      Tag = 200
      Caption = '200%'
      OnClick = Fitto1Click
    end
    object N4001: TMenuItem
      Tag = 400
      Caption = '400%'
      OnClick = Fitto1Click
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnHint = ApplicationEvents1Hint
    Left = 345
    Top = 65
  end
end

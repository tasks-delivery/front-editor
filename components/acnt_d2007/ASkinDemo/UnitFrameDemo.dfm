object FrameDemo: TFrameDemo
  Left = 0
  Top = 0
  Width = 161
  Height = 257
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  PopupMenu = PopupMenu1
  TabOrder = 0
  object sLabel1: TsLabel
    Left = 26
    Top = 8
    Width = 96
    Height = 42
    Alignment = taCenter
    AutoSize = False
    Caption = 'Custom frames with any controls may be placed here!'
    WordWrap = True
  end
  object sCheckBox1: TsCheckBox
    Left = 34
    Top = 60
    Width = 86
    Height = 17
    Caption = 'sCheckBox1'
    Checked = True
    State = cbChecked
    TabOrder = 0
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sGroupBox1: TsGroupBox
    Left = 18
    Top = 90
    Width = 121
    Height = 106
    Caption = 'sGroupBox1'
    TabOrder = 1
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object sSpeedButton1: TsSpeedButton
      Left = 9
      Top = 23
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Caption = 'Web button 1'
      Flat = True
      ParentFont = False
      SkinData.SkinSection = 'WEBBUTTON'
      Images = MainForm.sCharImageList1
      Alignment = taLeftJustify
      ImageIndex = 0
    end
    object sSpeedButton2: TsSpeedButton
      Left = 9
      Top = 48
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Caption = 'Web button 2'
      Flat = True
      ParentFont = False
      SkinData.SkinSection = 'WEBBUTTON'
      Images = MainForm.sCharImageList1
      Alignment = taLeftJustify
      ImageIndex = 1
    end
    object sSpeedButton3: TsSpeedButton
      Left = 9
      Top = 73
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Caption = 'Web button 3'
      Flat = True
      ParentFont = False
      SkinData.SkinSection = 'WEBBUTTON'
      Images = MainForm.sCharImageList1
      Alignment = taLeftJustify
      ImageIndex = 2
    end
  end
  object sTrackBar1: TsTrackBar
    Left = 22
    Top = 208
    Width = 114
    Height = 32
    TabOrder = 2
    SkinData.SkinSection = 'TRACKBAR'
    BarOffsetV = 0
    BarOffsetH = 0
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'BARPANEL'
    Left = 111
    Top = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 32
    object Item11: TMenuItem
      Caption = 'Item 1'
      object Item111: TMenuItem
        Caption = 'Item 11'
      end
      object Item121: TMenuItem
        Caption = 'Item 12'
      end
      object Item131: TMenuItem
        Caption = 'Item 13'
      end
    end
    object Item1: TMenuItem
      Caption = 'Item 2'
    end
    object Item31: TMenuItem
      Caption = 'Item 3'
    end
    object Item41: TMenuItem
      Caption = 'Item 4'
    end
  end
end

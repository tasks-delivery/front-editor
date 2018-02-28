object FrameTest: TFrameTest
  Left = 0
  Top = 0
  Width = 203
  Height = 58
  TabOrder = 0
  object sComboBox1: TsComboBox
    Left = 82
    Top = 17
    Width = 105
    Height = 21
    Alignment = taLeftJustify
    BoundLabel.Active = True
    BoundLabel.Caption = 'SkinSection:'
    VerticalAlignment = taAlignTop
    Style = csDropDownList
    ItemIndex = -1
    ParentFont = False
    TabOrder = 0
    OnChange = sComboBox1Change
    Items.Strings = (
      'PANEL'
      'GROUPBOX'
      'PANEL_LOW'
      'CHECKBOX'
      'BUTTON'
      'PROGRESSH')
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'GROUPBOX'
    Left = 8
    Top = 7
  end
end

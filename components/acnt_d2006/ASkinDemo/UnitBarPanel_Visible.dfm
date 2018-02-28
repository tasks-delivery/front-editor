object BarPanel_Visible: TBarPanel_Visible
  Tag = 5
  Left = 0
  Top = 0
  Width = 174
  Height = 314
  TabOrder = 0
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 174
    Height = 314
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object sTreeView1: TsTreeViewEx
      Left = 2
      Top = 2
      Width = 170
      Height = 310
      Cursor = crHandPoint
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      HideSelection = False
      HotTrack = True
      Indent = 19
      ReadOnly = True
      TabOrder = 0
      OnChange = sTreeView1Change
      SkinData.SkinSection = 'TRANSPARENT'
    end
  end
  object sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'BARPANEL'
    Left = 107
    Top = 70
  end
end

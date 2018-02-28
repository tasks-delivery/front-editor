inherited Frame_Frames: TFrame_Frames
  AutoScroll = True
  Width = 560
  Height = 423
  VertScrollBar.Tracking = True
  object sButton1: TsButton [0]
    Tag = 5
    Left = 13
    Top = 12
    Width = 117
    Height = 52
    Caption = 'Create new frame'
    TabOrder = 0
    OnClick = sButton1Click
  end
  object sButton2: TsButton [1]
    Tag = 5
    Left = 133
    Top = 12
    Width = 117
    Height = 52
    Caption = 'Remove frame'
    Enabled = False
    TabOrder = 1
    OnClick = sButton2Click
  end
end

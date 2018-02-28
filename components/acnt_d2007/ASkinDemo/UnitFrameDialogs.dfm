inherited Frame_Dialogs: TFrame_Dialogs
  OnResize = FrameResize
  object sGroupBox1: TsGroupBox [0]
    Left = 37
    Top = 15
    Width = 632
    Height = 238
    Caption = 'sMessageDlg function'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sEdit1: TsEdit
      Left = 249
      Top = 32
      Width = 218
      Height = 21
      TabOrder = 0
      Text = 'Message text'
      SkinData.SkinSection = 'EDIT'
    end
    object sGroupBox2: TsGroupBox
      Left = 249
      Top = 73
      Width = 152
      Height = 148
      Caption = 'Message type'
      TabOrder = 1
      CaptionLayout = clTopCenter
      SkinData.SkinSection = 'GROUPBOX'
      object sRadioButton1: TsRadioButton
        Left = 16
        Top = 21
        Width = 68
        Height = 17
        Caption = 'Warning'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object sRadioButton2: TsRadioButton
        Left = 16
        Top = 43
        Width = 52
        Height = 17
        Caption = 'Error'
        TabOrder = 1
      end
      object sRadioButton3: TsRadioButton
        Left = 16
        Top = 65
        Width = 84
        Height = 17
        Caption = 'Information'
        TabOrder = 2
      end
      object sRadioButton4: TsRadioButton
        Left = 16
        Top = 87
        Width = 89
        Height = 17
        Caption = 'Confirmation'
        TabOrder = 3
      end
    end
    object sButton1: TsButton
      Left = 500
      Top = 28
      Width = 98
      Height = 25
      Caption = 'Show dialog'
      TabOrder = 2
      OnClick = sButton1Click
    end
    object sRadioGroup1: TsRadioGroup
      Left = 33
      Top = 73
      Width = 186
      Height = 148
      Caption = 'Message buttons'
      ParentBackground = False
      TabOrder = 3
      CaptionLayout = clTopCenter
      SkinData.SkinSection = 'GROUPBOX'
      Items.Strings = (
        'OK'
        'OKCANCEL'
        'ABORTRETRYIGNORE'
        'YESNOCANCEL'
        'YESNO'
        'RETRYCANCEL')
    end
    object sCheckBox1: TsCheckBox
      Left = 492
      Top = 200
      Width = 113
      Height = 17
      Caption = 'Show Help button'
      Checked = True
      State = cbChecked
      TabOrder = 4
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sEdit4: TsEdit
      Left = 33
      Top = 32
      Width = 186
      Height = 21
      TabOrder = 5
      Text = 'Dialog title'
      SkinData.SkinSection = 'EDIT'
    end
  end
  object sGroupBox3: TsGroupBox [1]
    Left = 37
    Top = 274
    Width = 348
    Height = 102
    Caption = 'Messages'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object sEdit2: TsEdit
      Left = 28
      Top = 26
      Width = 291
      Height = 21
      TabOrder = 0
      Text = 'Message text for "sShowMessage" procedure'
      SkinData.SkinSection = 'EDIT'
    end
    object sButton2: TsButton
      Left = 50
      Top = 58
      Width = 117
      Height = 25
      Caption = 'sShowMessage'
      TabOrder = 1
      OnClick = sButton2Click
    end
    object sButton4: TsButton
      Left = 175
      Top = 58
      Width = 144
      Height = 25
      Caption = 'Application.MessageBox'
      TabOrder = 2
      OnClick = sButton4Click
    end
  end
  object sGroupBox4: TsGroupBox [2]
    Left = 405
    Top = 274
    Width = 264
    Height = 102
    Caption = 'sInputQuery function'
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object sEdit3: TsEdit
      Left = 20
      Top = 26
      Width = 213
      Height = 21
      TabOrder = 0
      Text = 'Message text for "sInputQuery" function'
      SkinData.SkinSection = 'EDIT'
    end
    object sButton3: TsButton
      Left = 135
      Top = 59
      Width = 98
      Height = 25
      Caption = 'Show dialog'
      TabOrder = 1
      OnClick = sButton3Click
    end
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 12
    Top = 16
  end
end

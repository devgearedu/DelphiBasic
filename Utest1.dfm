object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 310
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MyButton: TButton
    Left = 24
    Top = 23
    Width = 75
    Height = 25
    Caption = 'close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
    OnClick = MyButtonClick
  end
  object Button1: TButton
    Left = 112
    Top = 24
    Width = 75
    Height = 25
    Caption = #49549#49457#48320#44221
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 24
    Width = 75
    Height = 25
    Caption = #54648#46308#47084#44277#50976
    TabOrder = 2
    OnClick = MyButtonClick
  end
  object Button3: TButton
    Left = 281
    Top = 24
    Width = 75
    Height = 25
    Caption = #54648#46308#47084#54840#52636
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    Caption = #48320#49688
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 112
    Top = 64
    Width = 75
    Height = 25
    Caption = #54532#47196#49884#51200
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 200
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 281
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Divide'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 24
    Top = 112
    Width = 75
    Height = 25
    Caption = 'th '#49373#49457
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 24
    Top = 153
    Width = 75
    Height = 25
    Caption = #48260#53948#49373#49457
    TabOrder = 9
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 24
    Top = 234
    Width = 75
    Height = 25
    Caption = 'color'
    TabOrder = 10
    OnClick = Button10Click
  end
  object Button12: TButton
    Left = 24
    Top = 272
    Width = 75
    Height = 25
    Caption = 'font'
    TabOrder = 11
    OnClick = Button12Click
  end
  object GroupBox1: TGroupBox
    Left = 105
    Top = 95
    Width = 251
    Height = 210
    Caption = 'th '#51221#48372
    TabOrder = 12
    object Edit1: TEdit
      Left = 88
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 88
      Top = 43
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 88
      Top = 70
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 88
      Top = 97
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 88
      Top = 124
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 4
    end
    object Edit6: TEdit
      Left = 88
      Top = 151
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object Edit7: TEdit
      Left = 88
      Top = 178
      Width = 121
      Height = 21
      TabOrder = 6
    end
  end
  object ColorDialog1: TColorDialog
    Left = 32
    Top = 184
  end
end

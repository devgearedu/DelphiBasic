object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Edit1
  Caption = 'Form1'
  ClientHeight = 411
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    734
    411)
  PixelsPerInch = 96
  TextHeight = 13
  object myButton: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = myButtonClick
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
    Left = 208
    Top = 24
    Width = 75
    Height = 25
    Caption = #54648#46308#47084#44277#50976
    TabOrder = 2
    OnClick = myButtonClick
  end
  object Button3: TButton
    Left = 296
    Top = 24
    Width = 75
    Height = 25
    Caption = #54648#46308#47084#54840#52636
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = #48320#49688
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 112
    Top = 72
    Width = 75
    Height = 25
    Caption = #54532#47196#49884#51200
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 208
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 296
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Divde'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Th'#49373#49457
    TabOrder = 8
    OnClick = Button8Click
  end
  object GroupBox1: TGroupBox
    Left = 112
    Top = 103
    Width = 259
    Height = 283
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Th '#51221#48372
    TabOrder = 9
    object Label1: TLabel
      Left = 60
      Top = 24
      Width = 24
      Height = 13
      Caption = #51060#47492
    end
    object Label2: TLabel
      Left = 60
      Top = 51
      Width = 24
      Height = 13
      Caption = #45208#51060
    end
    object Label3: TLabel
      Left = 60
      Top = 83
      Width = 24
      Height = 13
      Caption = #51452#49548
    end
    object Label4: TLabel
      Left = 60
      Top = 122
      Width = 24
      Height = 13
      Caption = #54924#49324
    end
    object Label5: TLabel
      Left = 60
      Top = 147
      Width = 24
      Height = 13
      Caption = #44553#50668
    end
    object Edit2: TEdit
      Left = 120
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 120
      Top = 80
      Width = 121
      Height = 24
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 120
      Top = 117
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 120
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object Edit6: TEdit
      Left = 120
      Top = 171
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 120
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object Button9: TButton
    Left = 24
    Top = 166
    Width = 75
    Height = 25
    Caption = #48260#53948#49373#49457
    TabOrder = 10
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 24
    Top = 258
    Width = 75
    Height = 25
    Caption = 'Color'
    TabOrder = 11
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 24
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Font'
    TabOrder = 12
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 24
    Top = 327
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 13
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 24
    Top = 368
    Width = 75
    Height = 25
    Caption = 'ShowModal'
    TabOrder = 14
    OnClick = Button13Click
  end
  object Panel1: TPanel
    Left = 377
    Top = 0
    Width = 357
    Height = 411
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Panel1'
    DockSite = True
    TabOrder = 15
  end
  object ColorDialog1: TColorDialog
    Left = 8
    Top = 128
  end
end

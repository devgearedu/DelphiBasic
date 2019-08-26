unit utest1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MyButton: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button12: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ColorDialog1: TColorDialog;
    procedure MyButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure TestHandler(Sender:Tobject);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses utest4, utest3, utest2;
var
  h:th;
  Test_btn:TButton;
{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
begin
    if ColorDialog1.Execute then
       Color := ColorDialog1.Color;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  Fd:TFontDialog;
begin
  Fd := TFontDialog.Create(self);
  Caption := IntToStr(ComponentCount);
  if Fd.Execute then
     Font := Fd.Font;
  Fd.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MyButton.Caption :=  '´Ý±â';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   ShowMessage('my process');
   Button1Click(Button1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   Button4.Caption := IntToStr(i);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Hellow;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Button6.Caption := IntToStr(Add(7,2));
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Button7.Caption := IntToStr(Divide(12,3));
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if h = nil then
     h := Th.Create;

  Edit1.Text := h.GetName;
  Edit2.Text := IntToStr(h.Age);
  Edit3.Text := h.Address;
  Edit4.Text := H.Office;
  Edit5.Text := IntToStr(h.Salary);
//  h.Free;
  FreeAndNil(h);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
   Test_btn := Tbutton.Create(self);
   Caption := IntToStr(ComponentCount);
   Test_btn.Parent := self;
   Test_btn.Left := Button9.Left;
   Test_btn.Top := Button9.Top + Button9.Height + 16;
   Test_btn.Caption := 'test';
   Test_btn.SetFocus;
   Test_btn.OnClick := TestHandler;
//   test_btn.OnClick := nil;
end;

procedure TForm1.MyButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.TestHandler(Sender: Tobject);
begin
  ShowMessage('test');
end;

end.

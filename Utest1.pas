unit Utest1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    myButton: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    ColorDialog1: TColorDialog;
    Button12: TButton;
    Button13: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure myButtonClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    private
    { Private declarations }
    procedure TestHandler(sender:tobject);


  public

    { Public declarations }
  end;

const
  Screenwidth = 1024;
  ScreenHeight = 768;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uTest4, uTest2, uTest3;
var
  Test_Btn:TButton;
  h:Th;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
     Color := ColorDialog1.Color;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  Fd:TFontDialog;
begin
  fd := TFontDialog.Create(self);
  Caption := IntToStr(ComponentCount);
  if Fd.Execute then
     Font := Fd.Font;
  Fd.Free;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  i:byte;
begin
  for I := 0 to Application.ComponentCount - 1 do
    if Application.Components[i] is TForm2 then
    begin
      ( Application.Components[i] as TForm).Show;
      if (Application.Components[i] as TForm).WindowState = wsMinimized then
         (Application.Components[i] as TForm).WindowState := wsnormal;

      exit;
    end;
  Form2 := TForm2.Create(application);
  Caption := IntToStr(Application.ComponentCount);
  Form2.Show;
  Form2.ManualDock(Panel1);

end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Form3 := TForm3.Create(Application);
  Caption := inttostr(application.ComponentCount);
  if Form3.ShowModal = mrok then
     Caption := DateToStr(Form3.DateTimePicker1.Date);
  Form3.Free;
  Caption := IntToStr(Application.ComponentCount);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MyButton.Caption := '닫기';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage('My Process...');
  Button1Click(Button1);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Button4.Caption :=  IntToStr(i);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Hello;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Button6.Caption := IntToStr(Add(12,2));
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Button7.Caption := IntToStr(Divide(12,4));
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if h = nil then
     h := Th.Create;

  Edit1.Text := h.GetName;
  Edit2.Text := IntToStr(h.Age);
  Edit3.Text := h.Address;
  Edit4.Text := h.Office;
  Edit5.Text := IntToStr(h.Salary);
//  h.Free;
  FreeAndNil(h);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Test_Btn := TButton.Create(self);
  Caption := IntToStr(ComponentCount);
  Test_Btn.Parent := self;
  Test_Btn.Left := Button9.Left;
  Test_Btn.Top := Button9.Top + Button9.Height + 16;
  Test_Btn.Caption := 'test';
  Test_Btn.SetFocus;
  Test_Btn.OnClick := TestHandler;
//  Test_Btn.OnClick := nil;

end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_Return:SelectNext(Sender as TWincontrol, true, true);
    vk_up:SelectNext(Sender as TWincontrol, false, true);
    vk_Down:SelectNext(Sender as TWincontrol, true, true);
  end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key < '0') or (Key > '9') then
     Key := #0;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Caption := IntToStr(ComponentCount);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Edit1.Text <> '' then
  begin
     ShowMessagE('이름 지우시고 종료하세요');
     CanClose := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Scaled := True;
 if (Screen.Width <> ScreenWidth) then
 begin
   Height := LongInt(Height) * LongInt(Screen.Height) DIV ScreenHeight;
   Width := LongInt(Width) * LongInt(Screen.Width) DIV ScreenWidth;
   ScaleBy(Screen.Width, ScreenWidth);
 end;
  Button8Click(Button8);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_Return:SelectNext(ActiveControl, True, True);
    vk_Up:SelectNext(ActiveControl, False, True);
    vk_Down:SelectNext(ActiveControl, True, True);
  end;
end;

procedure TForm1.myButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.testHandler(sender: tobject);
begin
  ShowMessage('Test');
end;

end.

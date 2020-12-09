unit uget_ParentClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm21 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

{$R *.dfm}

procedure TForm21.Button1Click(Sender: TObject);
var
   classref :Tclass;
begin
  listbox1.Clear;
  classref := sender.ClassType;
  while ClassRef <> nil do
  begin
   ListBox1.Items.Add(ClassRef.ClassName);
	 ClassRef := ClassRef.ClassParent;

  end;

end;

procedure TForm21.FormActivate(Sender: TObject);
begin
  caption := inttostr(application.ComponentCount);
end;

end.

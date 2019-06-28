program Test;

uses
  Vcl.Forms,
  Utest1 in 'Utest1.pas' {Form1},
  utest4 in 'utest4.pas',
  uTest3 in 'uTest3.pas' {Form3},
  Vcl.Themes,
  Vcl.Styles,
  uTest2 in 'uTest2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Auric');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

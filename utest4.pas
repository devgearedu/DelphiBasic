unit utest4;

interface
uses
  vcl.dialogs;
type

  TPerson = class(TObject)
   private
    ttt:string;
   strict private
    ttt2:string;  //+2007
   public
    Name:string;
    Age:byte;
    Address:string;
    function GetName:string;
    constructor Create; virtual;
  end;

  TEmp = class(TPerson)
    Office:string;
    function Salary:integer; virtual; abstract; //dynamic
    constructor Create; override;
  end;

  TH = class sealed(TEmp)
     Hrs:integer;
     Rate:integer;
     function Salary:integer; override; // final;
     constructor Create; override;
  end;

  TDog = class
     Name:string;
     Age:byte;
     Address:string;
     function GetName:string;
  end;

  Country = array [0..2] of string;

  Person = record
     Name:string;
     Age:byte;
     Address:string;
     function GetName:string;
  end;
//  p_person = ^person;

var
  p:^person;  //p_person;
  a1:array of string;
  a2:array of array of string;
  ps:pchar;
  pi:^integer;
  Countries:Country; // = ('korea','america','japan');
  s:string; //1.0:shortstring ,2.0~2009���� ansistring; 2009~ unicodestring;
  i:NativeInt = 100; //32 bit or 64 bit;
  r:real;
  t:TDateTime;
  b:boolean;  //bytebool, wordbool, longbool
  v:variant;
 //���� ���� �Ǽ� �Ҹ�, �迭, ����, ole boejct(����, ���� ,�Ŀ����ε�)������ ������ �־�
 // unssinged 16 byte, ���̻��--->> �޸𸮻�뷮 �߰�,��������
procedure Hello;
function Add(x:integer=2;y:integer=3):integer; inline;
function Sub(x,y:integer):integer;
function Divide(x,y:integer):integer; overload;
function Divide(x,y:real):extended; overload;

//������ ����� ��ƾ���� �����ϴ°�
//const, var, procedure, funciton ����-----> �ڱ�����Ʈ�� ������ ���
implementation
var
  j:integer;

procedure Hello;
var
  k:integer;
begin
  ShowMessage('�ȳ�');
end;
function Add(x,y:integer):integer;
begin
//   Add := x + y;
//   exit(x+y);      //2010 exit ���ϰ� ����
   result := x + y;  //+,-,*, div, /, mod
end;
function Sub(x,y:integer):integer;
begin
   result := x - y;
end;

function Divide(x,y:integer):integer;
begin
   result := x div y;
end;

function Divide(x,y:real):extended;
begin
   result := x / y;
end;

function Person.GetName:string;
begin
  result := Name;
end;

constructor TPerson.Create;
begin
  Name := '�����';
  Age := 20;
  Address := '���ʱ� ������ ������';
end;

function TPerson.GetName: string;
begin
   result := Name;
end;

function TDog.GetName: string;
begin
  result := Name;
end;

constructor TH.Create;
begin
  inherited;
  Hrs := 10;
  Rate := 100000;
end;

function TH.Salary: integer;
begin
  result := Hrs * Rate;
end;

constructor Temp.Create;
begin
  inherited;
  Office := '������';
end;

//uses���� ������ ���� :�ʱ�ó��(�޸��Ҵ� ����Ʈ������)
initialization
begin
  Countries[0] := '�ѱ�';
  Countries[1] := '�̱�';
  Countries[2] := '�Ϻ�';

  SetLength(a1,2);
  a1[0] := 'a1';
  SetLength(a2,2,2);
  a2[0,0] := 'a2';
end;
finalization
end.

unit utest4;
//type, const, var, procedure, function ����
//�̰��� �����  type, const,var, procedure, function���� �ڱ� ����Ʈ �� �ܺ� ����Ʈ������ ��� ����(uses)
interface
uses
  vcl.Dialogs;
type

  TPerson = class(tobject)
   private
    ttt:string;
   strict private     //+2007 strict protected
    ttt2:string;
   public
    name:string;
    Age:integer;
    Address:string;
    function GetName:string;
    constructor create; virtual;
  end;

  temp = class(tperson)
    office:string;
    function salary:integer; virtual; abstract;
    constructor create; override;
  end;

  th = class sealed(temp)
     hrs:integer;
     rate:integer;
     function salary:integer; override; // final;
     constructor create; override;
  end;

  TDog = class(tobject)
    name:string;
    Age:String;
    Address:string;
    function GetName:string;
  end;

  Person = record
    name:string;
    Age:String;
    Address:string;
    function GetName:string;
  end;
//  p_person = ^person;

  country = array [0..2] of string;
var
  p:^person;
  pa:pchar; //pansichar, pwidechar,punicodechar
  pi:^integer;
  a1:array of string;          //�����迭 1����
  a2:array of array of string; //�����迭 2����
  Countries:array [0..2] of string; // = ('korea', 'japan', 'america');
  s:string;  //1.0 shortstring; 2.0~2009���� AnsiString, 2009~ :unicodestring
  i:NativeInt = 100;  //32 or 64
  r:real;
  t:TDateTime;
  b:boolean;   //bytebool, wordbool, longbool;
  v:variant;
// ����,����,�Ǽ�,����,�Ҹ�,�����迭,�������, ole object(���� ����) ���� ������ �ִ� Ÿ��
// unsinged 16byte ----> �޸�ȿ������ �������� ���� ����
procedure Hellow;  inline;
function Add(x:integer=2; y:integer=3):integer;
function Sub(x,y:integer):integer;
function Divide(x,y:integer):integer; overload;
function Divide(x,y:real):extended; overload;
//������ ����� ��ƾ���� �ڵ� ����  �ϴ°�
//�ʿ��� ���� ��� ���ϵ��� ������ �� ����--->�ܺ�����Ʈ������ ��� �Ұ�
//�ڱ� �ؿ� ���� ��� ����
implementation
var
  j:integer;
procedure Hellow;
var
  k:integer;
begin
  ShowMessage('�ȳ�');
end;
function Add(x,y:integer):integer;
begin
  result := x + y;
//    exit(x+y);   +2010�������� ���ϰ� ��� ����
//   Add := x + y; //+,-,*,/, div,mod
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
function person.GetName:string;
begin
  result := name;
end;
//�ʱ�ó��:����Ʈ���Ҵ�,�޸��Ҵ�, ��ű������.....
//uses���� ������ ����
{ TPerson }

constructor TPerson.create;
begin
  name := '�����';
  Age := 20;
  Address := '���ʱ� ������ ������';
end;

function TPerson.GetName: string;
begin
  result := name;
end;

{ TDog }

function TDog.GetName: string;
begin
  result := name;
end;

{ th }

constructor th.create;
begin
  inherited;
  hrs := 10;
  rate := 100000;
end;

function th.salary: integer;
begin
   result := hrs * rate;
end;

{ temp }

constructor temp.create;
begin
  inherited;
  office := '������';
end;

initialization
  countries[0] := '�ѱ�';
  countries[1] := '�Ϻ�';
  countries[2] := '�̱�';
  SetLength(a1,2);
  a1[0] := 'a1';
  SetLength(a2,2,2);
  a2[0,0] := 'a2';
finalization


end.

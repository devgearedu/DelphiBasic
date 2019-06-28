unit utest2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Vcl.StdCtrls, Data.Bind.Components, Vcl.ExtCtrls, Data.Bind.Grid,
  Data.Bind.DBScope, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.ComCtrls;


type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabControl1: TTabControl;
    StringGrid1: TStringGrid;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Image1: TImage;
    LinkControlToField1: TLinkControlToField;
    Edit1: TEdit;
    LinkControlToField2: TLinkControlToField;
    Edit2: TEdit;
    LinkControlToField3: TLinkControlToField;
    StringGrid2: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ll(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PageControl1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PageControl1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PageControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageControl1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControl1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    FDraging: Boolean;
    FDragPos: TPoint;
    FDragTop: Integer;
    FDragLeft:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

type
  TTabDragObject = class(TBaseDragControlObject)
  private
    PageControl: TPageControl;
    DragImageList: TImageList;
    PageIndex: Integer;
    CurrentWnd: HWnd;
  protected
    procedure WndProc(var Msg: TMessage); override;
    function GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor; override;
  end;

implementation
var
 t: ttabsheet;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
 i:integer;
 Memo:TRichEdit;
begin
  t := TTabSheet.Create(pagecontrol1);
  t.Caption := '기타';
  t.PageControl := Pagecontrol1;
  Pagecontrol1.ActivePage := t;
  t.PageIndex := 0;
  memo := TRichEdit.create(T);
  Memo.parent := t;
  Memo.align := alClient;
  Memo.Lines.Clear;
  Memo.Lines.LoadFromFile('d:\sample.txt');
  stringgrid2.RowCount := 3;
  stringgrid2.Cells[0,0] := '부서명';
  StringGrid2.cells[1,0] := '과명';
  StringGrid2.cells[2,0] := '인원수';
  for I := 1 to stringgrid2.RowCount do
  begin
    stringgrid2.cells[0,i] := '교육부';
    stringgrid2.cells[1,i] := '과정' + inttostr(i);
    stringgrid2.cells[2,i] := inttostr(i);
  end;

end;

procedure TForm2.PageControl1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  HitTests: THitTests;
  SourceIndex, DestIndex: Integer;
begin
  HitTests := TPageControl(Sender).GetHitTestInfoAt( X, Y );
  if ( htOnItem in HitTests ) and ( Source is TTabDragObject ) and ( TTabDragObject(Source).PageControl = Sender ) then
   begin
     SourceIndex := TTabDragObject(Source).PageIndex;
     DestIndex := TPageControl(Sender).IndexOfTabAt( X, Y );

     TPageControl(Sender).Pages[ SourceIndex ].PageIndex := DestIndex;
   end;
end;

procedure TForm2.PageControl1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  HitTests: THitTests;
  DestIndex: Integer;
begin
  HitTests := TPageControl(Sender).GetHitTestInfoAt( X, Y );
  DestIndex := TPageControl(Sender).IndexOfTabAt( X, Y );
  Accept :=  ( htOnItem in HitTests ) and
             ( Source is TTabDragObject ) and
             ( TTabDragObject(Source).PageControl = Sender ) and
             ( TTabDragObject(Source).PageIndex <> TPageControl(Sender).Pages[ DestIndex ].PageIndex );

//  ImageList_Drag.DragMove( X - FDragLeft, FDragTop );
//  ImageList_Drag.ShowDragImage;

end;

procedure TForm2.PageControl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDraging := Button = mbLeft;
  if FDraging then
  FDragPos := Mouse.CursorPos;
end;

procedure TForm2.PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Bitmap: TBitmap;
  Rect: TRect;
  DC: HDC;
begin
  if FDraging and ( TPageControl(Sender).ActivePage <> nil ) then
   begin
     if ( Abs( FDragPos.X -  Mouse.CursorPos.X ) >= 5 ) or ( Abs( FDragPos.Y -  Mouse.CursorPos.Y ) >= 5 ) then
      begin
        TControl(Sender).BeginDrag( False );

        Bitmap := TBitmap.Create;
        Bitmap.PixelFormat := pf32Bit;

        Rect := TPageControl(Sender).TabRect( TPageControl(Sender).ActivePageIndex );

        InflateRect( Rect, 2, 2 );
        FDragTop := Rect.Top;
        FDragLeft := X - Rect.Left;
        Bitmap.Width := Rect.Right - Rect.Left;
        Bitmap.Height := Rect.Bottom - Rect.Top;

        DC := GetDC( TWinControl(Sender).Handle );
        BitBlt( Bitmap.Canvas.Handle, 0, 0, Bitmap.Width, Bitmap.Height, DC, Rect.Left, Rect.Top, SRCCOPY );
        ReleaseDC( TWinControl(Sender).Handle, DC );

//        Dark( Bitmap );
        ShowCursor( True );
      end;
end;
end;

procedure TForm2.PageControl1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Button = mbLeft then FDraging := False;

end;

procedure TForm2.PageControl1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  DragObject := TTabDragObject.Create( TPageControl(Sender) );
  TTabDragObject(DragObject).PageControl := TPageControl(Sender);
  TTabDragObject(DragObject).PageIndex := TPageControl(Sender).ActivePageIndex;

end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  pos:integer;
  OldAlign:integer;
begin
  s := stringGrid1.cells[acol, arow];
  with stringGrid1.Canvas do
  begin
    FillRect(rect);
    if ARow = 0 then
    begin
      Font.Color := clRed;
      Font.Size := Font.Size + 2;
    end;
    if ((acol= 1) or (acol = 2)) and (arow <> 0)  then
    begin
      oldAlign := SetTextAlign(handle, ta_right);
      TextRect(rect, rect.Right, rect.Top+3, s);
      SetTextAlign(handle, oldAlign);
    end
    else
    begin
      pos := ((Rect.Right - Rect.Left ) - TextWidth(s)) div 2;
      TextRect(Rect, Rect.Left + pos, Rect.Top + 3, s);
    end;
  end;
end;

procedure TForm2.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  pos:integer;
  OldAlign:integer;
begin
  s := StringGrid2.Cells[Acol, Arow];
  with StringGrid2.Canvas do
  begin
    FillRect(rect);
    if ARow = 0 then
    begin
      Font.Color := clRed;
      Font.Size := Font.Size + 2;
    end;
    if (Arow <> 0) and (Acol = 2) then
      begin
        s := s + '명';
        OldAlign := SetTextAlign(Handle, ta_right);
        TextRect(Rect, Rect.Right, Rect.Top + 3, s);
        SetTextAlign(Handle,OldAlign);
      end
    else
      begin
        pos := ((Rect.Right - Rect.Left) - TextWidth(s)) div 2;
        TextRect(Rect, Rect.Left + pos, Rect.Top + 3, s);
      end;
  end;

end;

procedure TForm2.ll(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s:string;
  pos:integer;
  OldAlign:integer;
begin
  s := stringGrid2.cells[acol, arow];
  with stringGrid2.Canvas do
  begin
    FillRect(rect);
    if ARow = 0 then
    begin
      Font.Color := clRed;
      Font.Size := Font.Size + 2;
    end;
    if (aRow <> 0) and (aCOL =2) then
    begin
       oldAlign  := SetTextAlign(handle, ta_Right);
       TextRect(Rect, Rect.Right , Rect.Top+3,s);
       SetTextAlign(handle, oldalign);
    end
    else
    begin
       pos := ((Rect.Right - Rect.Left) - TextWidth(s)) div 2;
       TextRect(Rect, Rect.Left+pos, Rect.Top + 3, s);
    end;

  end;

end;

{ TTabDragObject }

function TTabDragObject.GetDragCursor(Accepted: Boolean; X,
  Y: Integer): TCursor;
begin
  if Accepted then Result := crArrow
              else Result := crNoDrop;
end;

procedure TTabDragObject.WndProc(var Msg: TMessage);
var
  Wnd: HWnd;
begin
  inherited;

  case Msg.Msg of
  WM_MOUSEMOVE: begin
                  Wnd := WindowFromPoint( Mouse.CursorPos );

                  if Wnd <> CurrentWnd then
                   begin
                     if Wnd <> TWinControl(Control).Handle then
                      DragImageList.HideDragImage;

                     CurrentWnd := Wnd;
                   end;
                end;
  end;

end;

end.

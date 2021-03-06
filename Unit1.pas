unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    tmr1: TTimer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//Timer = class
//private
//  FClock: TTimer;
//  procedure ClockTimer(Sender: TObject);
//
//public
//  constructor Create;
//end;
//
TPoint = object
private
  x,y:Integer;
  figure:TShape;
public
  constructor Create(a,b:Integer; owner:TWinControl);
  procedure Show;
  procedure Hide;
  procedure Draw(vis:Boolean); virtual;
  procedure Set_Color(color:TColor);
  procedure Move(dx,dy:Integer);
end;
//
TCircle= object(TPoint)
private
  radius : Integer;
  FClock: TTimer;
//  procedure ClockTimer(Sender: TObject);
public
  constructor Create(a,b,c:Integer; owner : TWinControl);
  procedure Draw(vis:Boolean); virtual;
end;

var
  Form1: TForm1;
  Pointer : TPoint;
  Circle : TCircle;
  count : Integer;
  i:Integer;
implementation

{$R *.dfm}

{ TPoint }

constructor TPoint.Create(a, b: Integer; owner: TWinControl);
begin
  figure := TShape.Create(nil);
  figure.Parent := owner;
  figure.Visible := False;
  x:=a; y:=b;
end;

procedure TPoint.Draw(vis: Boolean);

begin
  with figure do
  begin
    shape := stCircle;
    brush.Style := bsClear;
    width :=500;
    height := width;
    left := x-1; top:= y-1;
    visible := vis;
  end
end;

procedure TPoint.Hide;
begin
  Draw(false);
end;

procedure TPoint.Move(dx, dy: Integer);
begin
  HIde;
  with figure do
  begin
    x:=x+dx; y:=y+dy;
  end;
  Show;
end;

procedure TPoint.Set_Color(color: TColor);
begin
  figure.Pen.Color:=color;
end;

procedure TPoint.Show;
begin
  Draw(True);
end;

{ TCircle }

constructor TCircle.Create(a, b, c: Integer; owner: TWinControl);
var clock:TTimer;
begin
  inherited Create(a,b,owner);
  radius := c;
//  clock := TTimer.Create(nil);
//  clock.interval:=1000;
//  clock.OnTimer := ClockTimer;
end;
//
procedure TCircle.Draw(vis: Boolean);
var timer:TTimer;
begin
  inherited;
  with figure do
  begin
    Left := x - radius;
    top:= y - radius;
    width := 2*radius;
    Height := Width;
  end;
end;
//
procedure TForm1.FormCreate(Sender: TObject);
  var Point:TPoint; i,n,middleX,middleY:Integer;
    begin
      for n:=1 to 10 do
      begin

      i:=250-50;
      count :=0;
      middleX:=Form1.ClientWidth div 2;                 //��������� �����
      middleY:=Form1.Clientheight div 2;
      Circle.Create(middleX,middleY,i,Form1);                        //�� �����
      Circle.Set_Color(clRed);
      Circle.Show;

      end;
    //  Point.Create(120, 30, Form1);    // ����� �� ��������
    //  Point.Set_Color(clRed);
    //  Point.Show;
   end;

procedure ClockTimer(Sender: TObject);
begin
 i:=i-30;
end;


end.

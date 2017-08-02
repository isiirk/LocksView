unit setup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, IniFiles,
  Vcl.Samples.Spin, Vcl.Grids;

type
  TFSetup = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    EMinimizeOnRun: TCheckBox;
    EFreq: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    EShowCountError: TSpinEdit;
    ServerList: TStringGrid;
    Panel3: TPanel;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ServerListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DeleteRow(ARow: Integer);
  end;

var
  FSetup: TFSetup;

implementation

{$R *.dfm}

uses main;

procedure TFSetup.DeleteRow(ARow: Integer);
var i, j: Integer;
begin
with ServerList do
  begin
    for i:=ARow+1 to RowCount-1 do
    for j:=0 to ColCount-1 do
      Cells[j, i-1]:=Cells[j, i];
    for i:=0 to ColCount-1 do
      Cells[i, RowCount-1]:='';
    RowCount:=RowCount-1;
  end;
end;



procedure TFSetup.Button1Click(Sender: TObject);
var
  IniFile: TIniFile;
  PathINI: string;
  i: integer;
begin

  MinimizeOnRun:=EMinimizeOnRun.Checked;
  Freq:=EFreq.Value;
  ShowErrorCount:=EShowCountError.Value;
  FMain.TimerCheck.Interval:=Freq*1000;


  PathINI:=ExtractFilePath(Application.ExeName)+ChangeFileExt(ExtractFilename(Application.ExeName),'.ini');
  IniFile := TiniFile.Create(PathINI);

  IniFile.WriteBool('Main', 'MinimizeOnRun', MinimizeOnRun);
  IniFile.WriteInteger('Main', 'Freq', Freq);
  IniFile.WriteInteger('Main', 'ShowErrorCount', ShowErrorCount);

  for i := 0 to 99 do
  begin
     IniFile.EraseSection('Server'+IntToStr(i));
  end;

  i:=1;
  while (ServerList.Cells[0,i]<>'') and (ServerList.Cells[1,i]<>'') and (ServerList.Cells[2,i]<>'') and (ServerList.RowCount>i) do
    begin
     IniFile.WriteString('Server'+IntToStr(i-1),'adress',ServerList.Cells[0,i]);
     IniFile.WriteString('Server'+IntToStr(i-1),'user',ServerList.Cells[1,i]);
     IniFile.WriteString('Server'+IntToStr(i-1),'password',ServerList.Cells[2,i]);
     Inc(i);
    end;

  FSetup.Close;
end;

procedure TFSetup.Button2Click(Sender: TObject);
begin
  FSetup.Close;
end;

procedure TFSetup.Button3Click(Sender: TObject);
begin
      ServerList.RowCount:= ServerList.RowCount+1;
end;

procedure TFSetup.Button4Click(Sender: TObject);
begin
   DeleteRow(ServerList.Row);
end;

procedure TFSetup.FormShow(Sender: TObject);
var
  IniFile: TIniFile;
  PathINI: string;
  i: integer;
begin
  EMinimizeOnRun.Checked:=MinimizeOnRun;
  EFreq.Value:=Freq;
  EShowCountError.Value:=ShowErrorCount;

  ServerList.RowCount:=1;
  ServerList.Cells[0,0]:='Имя сервера';
  ServerList.Cells[1,0]:='Пользователь';
  ServerList.Cells[2,0]:='Пароль';

  PathINI:=ExtractFilePath(Application.ExeName)+ChangeFileExt(ExtractFilename(Application.ExeName),'.ini');
  IniFile := TiniFile.Create(PathINI);

  i:=0;
  while IniFile.SectionExists('Server'+IntToStr(i)) do
    begin
      ServerList.RowCount:=ServerList.RowCount+1;
      ServerList.Cells[0,i+1]:=IniFile.ReadString('Server'+IntToStr(i),'adress','') ;
      ServerList.Cells[1,i+1]:=IniFile.ReadString('Server'+IntToStr(i),'user','') ;
      ServerList.Cells[2,i+1]:=IniFile.ReadString('Server'+IntToStr(i),'password','') ;
      Inc(i);
    end;


end;

procedure TFSetup.ServerListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_INSERT then //insert
    begin
      ServerList.RowCount:= ServerList.RowCount+1;
    end
  else if Key=VK_DELETE then   //delete
    begin
      if ServerList.Row>0 then
        begin
         DeleteRow(ServerList.Row);
        end;
    end;

end;

end.

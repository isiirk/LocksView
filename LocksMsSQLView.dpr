program LocksMsSQLView;

uses
  Vcl.Forms,
  main in 'main.pas' {FMain},
  setup in 'setup.pas' {FSetup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFSetup, FSetup);
  Application.Run;
end.

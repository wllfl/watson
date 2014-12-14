program Monitoramento;

uses
  Forms,
  Principal in 'Principal.pas' {Form1},
  Cad in 'Cad.pas' {Form2},
  DMMoni in 'DMMoni.pas' {dm: TDataModule},
  Monitor in 'Monitor.pas' {Form3},
  CadastRota in 'CadastRota.pas' {Form4},
  consulta in 'consulta.pas' {consultar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(Tconsultar, consultar);
  Application.Run;
end.

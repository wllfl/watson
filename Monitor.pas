unit Monitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SqlExpr, jpeg;

type
  TForm3 = class(TForm)
    tmpMonitoramento: TTimer;
    pnlSA0101: TPanel;
    pnlBBD101: TPanel;
    pnlBBD102: TPanel;
    Image1: TImage;
    tmpPisca: TTimer;
    pnlST0101: TPanel;
    pnlBD0101: TPanel;
    pnlMG0101: TPanel;
    pnlBDU101: TPanel;
    pnlBSC101: TPanel;
    pnlBSC202: TPanel;
    pnlBDU104: TPanel;
    pnlBDU103: TPanel;
    pnlBDU102: TPanel;
    Panel1: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    pnlBSC0202: TPanel;
    pnlBSP101: TPanel;
    pnlBBD201: TPanel;
    pnlBSP201: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    pnlSA0201: TPanel;
    Timer1: TTimer;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel3: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    procedure pnlBBD101Click(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure tmpPiscaTimer(Sender: TObject);
    procedure tmpMonitoramentoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses DMMoni;

{$R *.dfm}

procedure TForm3.btnIniciarClick(Sender: TObject);
begin
    {tmpPisca.Enabled := true; }
end;

procedure TForm3.btnPararClick(Sender: TObject);
begin
     {tmpPisca.Enabled := false;
     pnlKDB.Color := clGreen;
     pnlKDB.Visible := true; }
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
    dm.cdsMonitoramento.Open;
end;

procedure TForm3.pnlBBD101Click(Sender: TObject);

begin

    {if datamodule3.ClientDataSet1.FieldByName('ROTA').AsString = 'B01' then
      panel2.Color:= clred
    else if datamodule3.ClientDataSet1.FieldByName('ROTA').AsString = 'TW' then
      panel2.Color:= clred;

    panel2.Color:= clWindowText;}

  end;

procedure TForm3.Timer1Timer(Sender: TObject);
var
   qryAux, qryAux2: TSQLQuery;
begin
   try
      qryAux2 := TSQLQuery.Create(nil);
      qryAux2.SQLConnection := dm.SQLConnection1;

         qryAux2.Close;
         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add('SELECT ID, ROTA, COD_ATRASO, OBS, DATA, HORA_INI,HORA_REAL, HORA_FIM,HORA_REAL_FIM , STATUS FROM Monitoramento ');
         qryAux2.SQL.Add('WHERE DATA = :data AND STATUS = :status');
         qryAux2.ParamByName('data').asstring := FormatDateTime('dd/mm/yyyy', now);
         qryAux2.ParamByName('status').asstring := 'AGUARDANDO';
         qryAux2.Open;
         qryAux2.Open;

         if not qryAux2.IsEmpty then
         begin
             try
                 qryAux := TSQLQuery.Create(nil);
                 qryAux.SQLConnection := dm.SQLConnection1;

                 while not qryAux2.Eof do
                 begin
                     if (StrToTime(qryAux2.FieldByName('HORA_INI').AsString) <= Time) THEN


                     begin
                         qryAux.Close;
                         qryAux.SQL.Clear;
                         qryAux.SQL.Add('SELECT id_monitoramento FROM controle_panel ');
                         qryAux.SQL.Add('WHERE id_monitoramento = :id');
                         qryAux.ParamByName('id').AsInteger := qryAux2.FieldByName('ID').AsInteger;
                         qryAux.Open;

                         if qryAux.IsEmpty then
                         begin
                           dm.cdsControle.Open;
                           dm.cdsControle.Append;
                           dm.cdsControle.FieldByName('id_monitoramento').AsInteger := qryAux2.FieldByName('ID').AsInteger;
                           dm.cdsControle.FieldByName('rota').AsString := qryAux2.FieldByName('ROTA').AsString;
                           dm.cdsControle.FieldByName('status').AsString := 'Ativo';
                           dm.cdsControle.Post;
                           dm.cdsControle.ApplyUpdates(0);
                         end;
                     end;

                     qryAux2.Next;
                 end;
             finally
                 FreeAndNil(qryAux);
             end;
         end;
    finally
        FreeAndNil(qryAux2);
    end;
end;


procedure TForm3.tmpMonitoramentoTimer(Sender: TObject);
var
   qryAux, qryAux2: TSQLQuery;
begin
    try
      qryAux2 := TSQLQuery.Create(nil);
      qryAux2.SQLConnection := dm.SQLConnection1;

         qryAux2.Close;
         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.Add('SELECT ID, ROTA, COD_ATRASO, OBS, DATA, HORA_INI,HORA_REAL, HORA_FIM,HORA_REAL_FIM , STATUS FROM Monitoramento ');
         qryAux2.SQL.Add('WHERE DATA = :data AND STATUS = :status');
         qryAux2.ParamByName('data').asstring := FormatDateTime('dd/mm/yyyy', now);
         qryAux2.ParamByName('status').asstring := 'EM ANDAMENTO';
         qryAux2.Open;
         qryAux2.Open;

         if not qryAux2.IsEmpty then
         begin
             try
                 qryAux := TSQLQuery.Create(nil);
                 qryAux.SQLConnection := dm.SQLConnection1;

                 while not qryAux2.Eof do
                 begin
                     if (StrToTime(qryAux2.FieldByName('HORA_INI').AsString) < Time) and
                     (StrToTime(qryAux2.FieldByName('HORA_FIM').AsString) <= Time) then

                     begin
                         qryAux.Close;
                         qryAux.SQL.Clear;
                         qryAux.SQL.Add('SELECT id_monitoramento FROM controle_panel ');
                         qryAux.SQL.Add('WHERE id_monitoramento = :id');
                         qryAux.ParamByName('id').AsInteger := qryAux2.FieldByName('ID').AsInteger;
                         qryAux.Open;

                         if qryAux.IsEmpty then
                         begin
                           dm.cdsControle.Open;
                           dm.cdsControle.Append;
                           dm.cdsControle.FieldByName('id_monitoramento').AsInteger := qryAux2.FieldByName('ID').AsInteger;
                           dm.cdsControle.FieldByName('rota').AsString := qryAux2.FieldByName('ROTA').AsString;
                           dm.cdsControle.FieldByName('status').AsString := 'Ativo';
                           dm.cdsControle.Post;
                           dm.cdsControle.ApplyUpdates(0);
                         end;
                     end;

                     qryAux2.Next;
                 end;
             finally
                 FreeAndNil(qryAux);
             end;
         end;
    finally
        FreeAndNil(qryAux2);
    end;
end;

procedure TForm3.tmpPiscaTimer(Sender: TObject);
var
   qry, qry2 : TSQLQuery;
   i: integer;
begin
    try
       qry := TSQLQuery.Create(nil);
       qry.SQLConnection := dm.SQLConnection1;

       qry.Close;
       qry.SQL.Clear;
       qry.SQL.Add('SELECT id_monitoramento, rota FROM controle_panel WHERE status = :status');
       qry.ParamByName('status').AsString := 'Ativo';
       qry.Open;

       if not qry.IsEmpty then
       begin
           while not qry.Eof do
           begin
              for i := 0 to ComponentCount -1 do
              begin
                   if (Components[i] is TPanel) and (TPanel(Components[i]).Caption = qry.FieldByName('rota').AsString) then
                   begin
                       TPanel(Components[i]).Color   := clRed;
                       TPanel(Components[i]).Visible := not TPanel(Components[i]).Visible;
                   end
              end;

              qry.Next;
           end;
       end;

       qry2 := TSQLQuery.Create(nil);
       qry2.SQLConnection := dm.SQLConnection1;

       qry2.Close;
       qry2.SQL.Clear;
       qry2.SQL.Add('SELECT rota FROM monitoramento WHERE rota not in(SELECT rota FROM controle_panel)');
       qry2.Open;

       if not qry2.IsEmpty then
       begin
           while not qry2.Eof do
           begin
              for i := 0 to ComponentCount -1 do
              begin
                   if (Components[i] is TPanel) and (TPanel(Components[i]).Caption = qry2.FieldByName('rota').AsString) then
                   begin
                       TPanel(Components[i]).Color   := clGreen;
                       TPanel(Components[i]).Visible := true;
                   end
              end;

              qry2.Next;
           end;
       end;
    finally
        FreeAndNil(qry);
        FreeAndNil(qry2);
    end;
end;

end.

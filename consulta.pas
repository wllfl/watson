unit consulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Grids, DBGrids,ComObj, pngimage,
  ExtCtrls, TeEngine, TeeProcs, Chart, DBChart, Mask, TeeDBEdit, TeeDBCrossTab,
  Series, GanttCh, TeePrevi, RpDefine, RpRave;

type
  Tconsultar = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Image1: TImage;
    dtpEntrada: TDateTimePicker;
    dtpSaida: TDateTimePicker;
    edtRota: TEdit;
    lblContador: TLabel;
    chkSim: TCheckBox;
    chkNao: TCheckBox;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    dtpent: TDateTimePicker;
    dtpsaid: TDateTimePicker;
    DBGrid2: TDBGrid;
    dbcht1: TDBChart;
    DBChart2: TDBChart;
    Series2: TGanttSeries;
    Series3: TPieSeries;
    Label3: TLabel;
    imprimi: TRvProject;
    Button3: TButton;
    edtcliente: TEdit;
    dbcrstbsrc1: TDBCrossTabSource;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure dtpSaidaChange(Sender: TObject);
    procedure dtpsaidChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  consultar: Tconsultar;

implementation

uses DMMoni;

{$R *.dfm}

procedure Tconsultar.Button1Click(Sender: TObject);
   begin
  with DMMoni.dm.QryAula do
begin
SQL.Clear;
SQL.add('SELECT DATA,ROTA,ATRASADO,CLIENTE,COUNT(*) FROM monitoramento WHERE ATRASADO="NAO" AND ROTA="MR05" GROUP BY DATA');
Open;
DBGrid1.DataSource;
close;
end;
END;
procedure Tconsultar.Button2Click(Sender: TObject);
var
  PLANILHA : Variant;
  Linha : Integer;
Begin
 inherited;
                // qy_ocorre -----> minha query

 DMMoni.dm.cdsMonitoramento.Filtered := False;
 Linha :=2;
 PLANILHA := CreateOleObject('Excel.Application');
 PLANILHA.Caption := 'MINHA PLANILHA';
 PLANILHA.Visible := False;
 PLANILHA.WorkBooks.add(1);
          // TITULO DAS COLUNAS

 PLANILHA.Cells[1,1] := 'ROTA';
 PLANILHA.Cells[1,2] := 'CLIENTE';
 PLANILHA.Cells[1,3] := 'ORIGEM';
 PLANILHA.Cells[1,4] := 'DESTINO';
 PLANILHA.Cells[1,5] := 'DATA';
 PLANILHA.Cells[1,6] := 'HORA_INI';
 PLANILHA.Cells[1,7] := 'CHEGADA_REAL';
 PLANILHA.Cells[1,8] := 'HORA_FIM';
 PLANILHA.Cells[1,9] := 'HORA_REAL_FIM';
 PLANILHA.Cells[1,10] := 'COD_ATRASO';
 PLANILHA.Cells[1,11] := 'OBS';
 PLANILHA.Cells[1,12] := 'CAMINHAO';
 PLANILHA.Cells[1,13] := 'PLACA';
 PLANILHA.Cells[1,14] := 'MOTORISTA';



 DMMoni.dm.cdsMonitoramento.DisableControls;

    // PRRENCHIMENTO DAS C�LULAS COM OS VALORES DOS CAMPOS DA TABELA
 Try
    While not DMMoni.dm.cdsMonitoramento.Eof do

    Begin
       PLANILHA.Cells[Linha,1]:=    DMMoni.dm.cdsMonitoramentoROTA.Value;
       PLANILHA.Cells[linha,2] :=    DMMoni.dm.cdsMonitoramentoCLIENTE.Value;
       PLANILHA.Cells[Linha,3] :=    DMMoni.dm.cdsMonitoramentoORIGEM.Value;
       PLANILHA.Cells[Linha,4] :=    DMMoni.dm.cdsMonitoramentoDESTINO.Value;
       PLANILHA.Cells[Linha,5] :=    DMMoni.dm.cdsMonitoramentoDATA.Value;
       PLANILHA.Cells[Linha,6] :=    DMMoni.dm.cdsMonitoramentoHORA_INI.Value;
       PLANILHA.Cells[Linha,7] :=    DMMoni.dm.cdsMonitoramentoHORA_REAL.Value;
       PLANILHA.Cells[Linha,8] :=    DMMoni.dm.cdsMonitoramentoHORA_FIM.Value;
       PLANILHA.Cells[Linha,9] :=    DMMoni.dm.cdsMonitoramentoHORA_REAL_FIM.Value;
       PLANILHA.Cells[Linha,10] :=    DMMoni.dm.cdsMonitoramentoCOD_ATRASO.Value;
       PLANILHA.Cells[Linha,11] :=    DMMoni.dm.cdsMonitoramentoOBS.Value;
       PLANILHA.Cells[Linha,12] :=    DMMoni.dm.cdsMonitoramentoCAMINHAO.Value;
       PLANILHA.Cells[Linha,13] :=    DMMoni.dm.cdsMonitoramentoPLACA.Value;
       PLANILHA.Cells[Linha,14] :=    DMMoni.dm.cdsMonitoramentoMOTORISTA.Value;

       Linha := Linha + 1;
          DMMoni.dm.cdsMonitoramento.Next;
     End;
     PLANILHA.Columns.AutoFit;

     PLANILHA.Visible := True;
 Finally
 DMMoni.dm.cdsMonitoramento.EnableControls;
    PLANILHA := Unassigned;
 end; // TRY

End;





procedure Tconsultar.Button3Click(Sender: TObject);
begin
DBChart1.Print;

end;

procedure Tconsultar.DBEdit1Change(Sender: TObject);
begin
{if DBEdit1.Text <> '' then
  begin
      dm.cdsmonitoramento.Close;
      dm.qryMonitoramento.Close;
      dm.qryMonitoramento.SQL.Clear;
      dm.qryMonitoramento.SQL.Add('SELECT atraso,rota, CONCAT(  data) AS  rota FROM monitoramento WHERE atrasado :parametro1');
      dm.qryMonitoramento.ParamByName('parametro1').AsString := DBEdit1.text;
      //dm.qryMonitoramento.ParamByName('parametro2').AsString := DBEdit2.text;

      dm.qryMonitoramento.Open;
      dm.cdsmonitoramento.Open;

      if dm.cdsmonitoramento.recordCount > 0 then
      begin
        edit3.Text := dm.qryMonitoramento.ParamByName('atrasado').Text;
      end;
  end;  }
 end;

procedure Tconsultar.dtpSaidaChange(Sender: TObject);
var
  opcao: string;
begin
    if edtRota.Text <> '' then
    begin
        if dtpEntrada.Date <= dtpSaida.Date then
        begin
            dm.cdsRelatorio.Close;
            dm.qryRelatorio.Close;
            dm.qryRelatorio.SQL.Clear;
            dm.qryRelatorio.SQL.Add('SELECT atrasado,rota, data ,cod_atraso,OBS,Destino FROM monitoramento WHERE rota = :rota and Destino =:parametro1 and DATA_FORMATO >= :dtEntrada and DATA_FORMATO <= :dtSaida');
            if (chkNao.Checked AND not chkSim.Checked) or (chkSim.Checked AND not chkNao.Checked) then
            begin
                if chkSim.Checked then dm.qryRelatorio.SQL.Add(' and atrasado = ' + QuotedStr('SIM'));
                if chkNao.Checked then dm.qryRelatorio.SQL.Add(' and atrasado = ' + QuotedStr('NAO'));

            end;
            dm.qryRelatorio.ParamByName('rota').AsString := edtRota.Text;
            dm.qryRelatorio.ParamByName('dtEntrada').AsDateTime := dtpEntrada.Date;
            dm.qryRelatorio.ParamByName('dtSaida').AsDateTime := dtpSaida.Date;
            dm.qryRelatorio.ParamByName('parametro1').AsString := edtcliente.Text;
            dm.qryRelatorio.Open;
            dm.cdsRelatorio.Open;

            if dm.cdsRelatorio.recordCount > 0 then
            begin
               lblContador.Visible := True;
               lblContador.Caption := 'Total de atrasos: ' + IntToStr(dm.cdsRelatorio.RecordCount);
            end
            else
              lblContador.Visible := false;
        end
        else
           MessageDlg('A data de entrada deve ser menor ou igual a data de sa�da!', mtWarning, [mbOK], 0);
    end
    else
         MessageDlg('� necess�rio informar uma rota!', mtWarning, [mbOK], 0);

end;

procedure Tconsultar.dtpsaidChange(Sender: TObject);
var
  opcao: string;
begin
    if edtRota.Text <> '' then
    begin
        if dtpEntrada.Date <= dtpSaida.Date then
        begin
            dm.cdsRelator.Close;
            dm.qryRelator.Close;
            dm.qryRelator.SQL.Clear;
            dm.qryRelator.SQL.Add('SELECT atraso,rota, data ,cod_atraso,OBS FROM monitoramento WHERE rota = :rota and DATA_FORMATO >= :dtEntrada and DATA_FORMATO <= :dtSaida');
            if (chkNao.Checked AND not chkSim.Checked) or (chkSim.Checked AND not chkNao.Checked) then
            begin
                if chkSim.Checked then dm.qryRelator.SQL.Add(' and atraso = ' + QuotedStr('SIM'));
                if chkNao.Checked then dm.qryRelator.SQL.Add(' and atraso = ' + QuotedStr('NAO'));
            end;
            dm.qryRelator.ParamByName('rota').AsString := edtRota.Text;
            dm.qryRelator.ParamByName('dtEntrada').AsDateTime := dtpent.Date;
            dm.qryRelator.ParamByName('dtSaida').AsDateTime := dtpsaid.Date;
            dm.qryRelator.Open;
            dm.cdsRelator.Open;

            if dm.cdsRelator.recordCount > 0 then
            begin
               lblContador.Visible := True;
               lblContador.Caption := 'Total de atrasos: ' + IntToStr(dm.cdsRelator.RecordCount);
            end
            else
              lblContador.Visible := false;
        end
        else
           MessageDlg('A data de entrada deve ser menor ou igual a data de sa�da!', mtWarning, [mbOK], 0);
    end
    else
         MessageDlg('� necess�rio informar uma rota!', mtWarning, [mbOK], 0);
end;


procedure Tconsultar.Edit1Change(Sender: TObject);
begin
//dm.cdsmonitoramento.Filtered := False;
//dm.cdsmonitoramento.Filter := 'ROTA LIKE '+QuotedStr(dbEdit2.text+'%') + ' AND data = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', date));
//dm.cdsmonitoramento.Filtered := true;
end;

procedure Tconsultar.Edit3Change(Sender: TObject);
begin
//dm.cdsmonitoramento.Filtered := False;
//dm.cdsmonitoramento.Filter := 'ATRASO LIKE '+QuotedStr(Edit3.text+'%') + ' AND data = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', date));
//dm.cdsmonitoramento.Filtered := true;
end;

END.

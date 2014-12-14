unit DMMoni;

interface

uses
  SysUtils, Classes, DBXMySQL, FMTBcd, Provider, DBClient, DB, SqlExpr;

type
  Tdm = class(TDataModule)
    SQLConnection1: TSQLConnection;
    qryMonitoramento: TSQLQuery;
    dtsMonitoramento: TDataSource;
    cdsMonitoramento: TClientDataSet;
    dspMonitoramento: TDataSetProvider;
    qryMonitoramentoROTA: TStringField;
    qryMonitoramentoDATA: TStringField;
    qryMonitoramentoHORA_INI: TStringField;
    qryMonitoramentoHORA_FIM: TStringField;
    qryMonitoramentoCOD_ATRASO: TStringField;
    qryMonitoramentoOBS: TStringField;
    qryMonitoramentoSTATUS: TStringField;
    cdsMonitoramentoROTA: TStringField;
    cdsMonitoramentoDATA: TStringField;
    cdsMonitoramentoHORA_INI: TStringField;
    cdsMonitoramentoHORA_FIM: TStringField;
    cdsMonitoramentoCOD_ATRASO: TStringField;
    cdsMonitoramentoOBS: TStringField;
    qryControle: TSQLQuery;
    dspControle: TDataSetProvider;
    cdsControle: TClientDataSet;
    dtsControle: TDataSource;
    qryControleid: TIntegerField;
    qryControlerota: TStringField;
    qryControlestatus: TStringField;
    cdsControleid: TIntegerField;
    cdsControlerota: TStringField;
    cdsControlestatus: TStringField;
    qryControleid_monitoramento: TIntegerField;
    cdsControleid_monitoramento: TIntegerField;
    qryMonitoramentoID: TIntegerField;
    cdsMonitoramentoSTATUS: TStringField;
    cdsMonitoramentoID: TIntegerField;
    qryMonitoramentoCLIENTE: TStringField;
    qryMonitoramentoORIGEM: TStringField;
    qryMonitoramentoDESTINO: TStringField;
    cdsMonitoramentoCLIENTE: TStringField;
    cdsMonitoramentoORIGEM: TStringField;
    cdsMonitoramentoDESTINO: TStringField;
    qryRota: TSQLQuery;
    cdsRota: TClientDataSet;
    dspRota: TDataSetProvider;
    dtsRota: TDataSource;
    cdsRotaID: TIntegerField;
    cdsRotaROTA: TStringField;
    cdsRotaCLIENTE: TStringField;
    cdsRotaORIGEM: TStringField;
    cdsRotaDESTINO: TStringField;
    cdsRotaHORA_INICIO: TStringField;
    cdsRotaHORA_FIM: TStringField;
    cdsRotaSTATUS: TStringField;
    qryRotaID: TIntegerField;
    qryRotaROTA: TStringField;
    qryRotaCLIENTE: TStringField;
    qryRotaORIGEM: TStringField;
    qryRotaDESTINO: TStringField;
    qryRotaHORA_INICIO: TStringField;
    qryRotaHORA_FIM: TStringField;
    qryRotaSTATUS: TStringField;
    qryMonitoramentoID_ROTA: TIntegerField;
    cdsMonitoramentoID_ROTA: TIntegerField;
    qryMonitoramentoHORA_REAL: TStringField;
    qryMonitoramentoHORA_REAL_FIM: TStringField;
    cdsMonitoramentoHORA_REAL: TStringField;
    cdsMonitoramentoHORA_REAL_FIM: TStringField;
    qryRotaHORA_REAL: TStringField;
    qryRotaHORA_REAL_FIM: TStringField;
    cdsRotaHORA_REAL: TStringField;
    cdsRotaHORA_REAL_FIM: TStringField;
    qryRotaCOD_ATRASO: TStringField;
    cdsRotaCOD_ATRASO: TStringField;
    qryRotaOBS: TStringField;
    cdsRotaOBS: TStringField;
    qryMonitoramentoCAMINHAO: TStringField;
    qryMonitoramentoPLACA: TStringField;
    qryMonitoramentoMOTORISTA: TStringField;
    cdsMonitoramentoCAMINHAO: TStringField;
    cdsMonitoramentoPLACA: TStringField;
    cdsMonitoramentoMOTORISTA: TStringField;
    qryRotaCAMINHAO: TStringField;
    qryRotaPLACA: TStringField;
    qryRotaMOTORISTA: TStringField;
    cdsRotaCAMINHAO: TStringField;
    cdsRotaPLACA: TStringField;
    cdsRotaMOTORISTA: TStringField;
    qryMonitoramentoLOCAL_ATUAL: TStringField;
    qryMonitoramentoTIPO: TStringField;
    cdsMonitoramentoLOCAL_ATUAL: TStringField;
    cdsMonitoramentoTIPO: TStringField;
    qryMonitoramentoCHEGADA_REAL: TStringField;
    cdsMonitoramentoCHEGADA_REAL: TStringField;
    qryMonitoramentoATRASADO: TStringField;
    cdsMonitoramentoATRASADO: TStringField;
    qryMonitoramentoATRASO: TStringField;
    cdsMonitoramentoATRASO: TStringField;
    QryAula: TSQLQuery;
    dsAula: TDataSource;
    cdsAula: TClientDataSet;
    dspAula: TDataSetProvider;
    dtsRelatorio: TDataSource;
    cdsRelatorio: TClientDataSet;
    dspRelatorio: TDataSetProvider;
    qryRelatorio: TSQLQuery;
    qryRelatoriorota: TStringField;
    qryRelatoriodata: TStringField;
    cdsRelatoriorota: TStringField;
    cdsRelatoriodata: TStringField;
    qryRelatorioatrasado: TStringField;
    cdsRelatorioatrasado: TStringField;
    qryRelatoriocod_atraso: TStringField;
    cdsRelatoriocod_atraso: TStringField;
    qryRelatorioobs: TStringField;
    cdsRelatorioobs: TStringField;
    dspRelator: TDataSetProvider;
    cdsRelator: TClientDataSet;
    dstRelator: TDataSource;
    qryRelator: TSQLQuery;
    qryRelatoratraso: TStringField;
    qryRelatorrota: TStringField;
    qryRelatordata: TStringField;
    qryRelatorcod_atraso: TStringField;
    qryRelatorobs: TStringField;
    cdsRelatoratraso: TStringField;
    cdsRelatorrota: TStringField;
    cdsRelatordata: TStringField;
    cdsRelatorcod_atraso: TStringField;
    cdsRelatorobs: TStringField;
    qryMonitoramentoOBS1: TStringField;
    cdsMonitoramentoOBS1: TStringField;
    qryRelatoriodestino: TStringField;
    cdsRelatoriodestino: TStringField;
    qryMonitoramentoDATA_FORMATO: TDateField;
    cdsMonitoramentoDATA_FORMATO: TDateField;
    procedure cdsMonitoramentoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses Cad;

{$R *.dfm}

procedure Tdm.cdsMonitoramentoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
var
  qry: TSQLQuery;
begin
    if Assigned(Form2) then
    begin
        if dm.cdsMonitoramento.FieldByName('STATUS').AsString = 'FINALIZADO' then
        begin
             try
                 qry := TSQLQuery.Create(nil);
                 qry.SQLConnection := dm.SQLConnection1;

                 qry.Close;
                 qry.SQL.Clear;
                 qry.SQL.Add('DELETE FROM controle_panel WHERE id_monitoramento = :id');
                 qry.ParamByName('id').AsInteger := dm.cdsMonitoramento.FieldByName('ID').AsInteger;
                 qry.ExecSQL();

             finally
                 FreeAndNil(qry);
             end;
        end;
    end;
end;

end.

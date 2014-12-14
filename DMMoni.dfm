object dm: Tdm
  OldCreateOrder = False
  Left = 396
  Top = 171
  Height = 441
  Width = 477
  object SQLConnection1: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbxmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'GetDriverFunc=getSQLDriverMYSQL50'
      'LibraryName=dbxopenmysql50.dll'
      'VendorLib=libmysql.dll'
      'HostName=localhost'
      'Database=mysql'
      'User_Name=root'
      'Password=loide'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DriverName=MySQL'
      'ServerCharSet='
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    VendorLib = 'LIBMYSQL.dll'
    Connected = True
    Left = 48
    Top = 8
  end
  object qryMonitoramento: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'ID,'
      'ROTA,'
      'DATA,'
      'CLIENTE,'
      'ORIGEM,'
      'DESTINO,'
      'CHEGADA_REAL,'
      'DATA_FORMATO,'
      'HORA_INI,'
      'HORA_REAL,'
      'HORA_FIM,'
      'HORA_REAL_FIM,'
      'COD_ATRASO,'
      'OBS,'
      'OBS1,'
      'STATUS,'
      'CAMINHAO,'
      'PLACA,'
      'MOTORISTA,'
      'LOCAL_ATUAL,'
      'TIPO,'
      'ATRASADO,'
      'ATRASO,'
      'ID_ROTA'
      'FROM Monitoramento')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 112
    object qryMonitoramentoROTA: TStringField
      FieldName = 'ROTA'
      Size = 10
    end
    object qryMonitoramentoDATA: TStringField
      FieldName = 'DATA'
      Size = 10
    end
    object qryMonitoramentoHORA_INI: TStringField
      FieldName = 'HORA_INI'
      Size = 10
    end
    object qryMonitoramentoHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
    object qryMonitoramentoCOD_ATRASO: TStringField
      FieldName = 'COD_ATRASO'
      Size = 10
    end
    object qryMonitoramentoOBS: TStringField
      FieldName = 'OBS'
      Size = 50
    end
    object qryMonitoramentoSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object qryMonitoramentoID: TIntegerField
      FieldName = 'ID'
    end
    object qryMonitoramentoCLIENTE: TStringField
      FieldName = 'CLIENTE'
    end
    object qryMonitoramentoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 30
    end
    object qryMonitoramentoDESTINO: TStringField
      FieldName = 'DESTINO'
      Size = 30
    end
    object qryMonitoramentoID_ROTA: TIntegerField
      FieldName = 'ID_ROTA'
    end
    object qryMonitoramentoHORA_REAL: TStringField
      FieldName = 'HORA_REAL'
      Required = True
      Size = 10
    end
    object qryMonitoramentoHORA_REAL_FIM: TStringField
      FieldName = 'HORA_REAL_FIM'
      Required = True
      Size = 10
    end
    object qryMonitoramentoCAMINHAO: TStringField
      FieldName = 'CAMINHAO'
      Size = 15
    end
    object qryMonitoramentoPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object qryMonitoramentoMOTORISTA: TStringField
      FieldName = 'MOTORISTA'
    end
    object qryMonitoramentoLOCAL_ATUAL: TStringField
      FieldName = 'LOCAL_ATUAL'
      Required = True
      Size = 30
    end
    object qryMonitoramentoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
    object qryMonitoramentoCHEGADA_REAL: TStringField
      FieldName = 'CHEGADA_REAL'
      Required = True
      Size = 10
    end
    object qryMonitoramentoATRASADO: TStringField
      FieldName = 'ATRASADO'
      Required = True
      Size = 10
    end
    object qryMonitoramentoATRASO: TStringField
      FieldName = 'ATRASO'
      Required = True
      Size = 10
    end
    object qryMonitoramentoOBS1: TStringField
      FieldName = 'OBS1'
      Size = 50
    end
    object qryMonitoramentoDATA_FORMATO: TDateField
      FieldName = 'DATA_FORMATO'
      Required = True
    end
  end
  object dtsMonitoramento: TDataSource
    DataSet = cdsMonitoramento
    Left = 240
    Top = 120
  end
  object cdsMonitoramento: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMonitoramento'
    BeforeApplyUpdates = cdsMonitoramentoBeforeApplyUpdates
    Left = 112
    Top = 120
    object cdsMonitoramentoROTA: TStringField
      FieldName = 'ROTA'
      Size = 10
    end
    object cdsMonitoramentoDATA: TStringField
      FieldName = 'DATA'
      Size = 10
    end
    object cdsMonitoramentoHORA_INI: TStringField
      FieldName = 'HORA_INI'
      Size = 10
    end
    object cdsMonitoramentoHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
    object cdsMonitoramentoCOD_ATRASO: TStringField
      FieldName = 'COD_ATRASO'
      Size = 10
    end
    object cdsMonitoramentoOBS: TStringField
      FieldName = 'OBS'
      Size = 50
    end
    object cdsMonitoramentoSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object cdsMonitoramentoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsMonitoramentoCLIENTE: TStringField
      FieldName = 'CLIENTE'
    end
    object cdsMonitoramentoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 30
    end
    object cdsMonitoramentoDESTINO: TStringField
      FieldName = 'DESTINO'
      Size = 30
    end
    object cdsMonitoramentoID_ROTA: TIntegerField
      FieldName = 'ID_ROTA'
    end
    object cdsMonitoramentoHORA_REAL: TStringField
      FieldName = 'HORA_REAL'
      Required = True
      Size = 10
    end
    object cdsMonitoramentoHORA_REAL_FIM: TStringField
      FieldName = 'HORA_REAL_FIM'
      Required = True
      Size = 10
    end
    object cdsMonitoramentoCAMINHAO: TStringField
      FieldName = 'CAMINHAO'
      Size = 15
    end
    object cdsMonitoramentoPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsMonitoramentoMOTORISTA: TStringField
      FieldName = 'MOTORISTA'
    end
    object cdsMonitoramentoLOCAL_ATUAL: TStringField
      FieldName = 'LOCAL_ATUAL'
      Required = True
      Size = 30
    end
    object cdsMonitoramentoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
    end
    object cdsMonitoramentoCHEGADA_REAL: TStringField
      FieldName = 'CHEGADA_REAL'
      Required = True
      Size = 10
    end
    object cdsMonitoramentoATRASADO: TStringField
      FieldName = 'ATRASADO'
      Required = True
      Size = 10
    end
    object cdsMonitoramentoATRASO: TStringField
      FieldName = 'ATRASO'
      Required = True
      Size = 10
    end
    object cdsMonitoramentoOBS1: TStringField
      FieldName = 'OBS1'
      Size = 50
    end
    object cdsMonitoramentoDATA_FORMATO: TDateField
      FieldName = 'DATA_FORMATO'
      Required = True
    end
  end
  object dspMonitoramento: TDataSetProvider
    DataSet = qryMonitoramento
    Left = 184
    Top = 120
  end
  object qryControle: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      'id, '
      'rota, '
      'status,'
      'id_monitoramento'
      'FROM '
      'controle_panel')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 176
    object qryControleid: TIntegerField
      FieldName = 'id'
    end
    object qryControlerota: TStringField
      FieldName = 'rota'
      Size = 30
    end
    object qryControlestatus: TStringField
      FieldName = 'status'
      Size = 10
    end
    object qryControleid_monitoramento: TIntegerField
      FieldName = 'id_monitoramento'
      Required = True
    end
  end
  object dspControle: TDataSetProvider
    DataSet = qryControle
    Left = 168
    Top = 176
  end
  object cdsControle: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspControle'
    Left = 104
    Top = 176
    object cdsControleid: TIntegerField
      FieldName = 'id'
    end
    object cdsControlerota: TStringField
      FieldName = 'rota'
      Size = 30
    end
    object cdsControlestatus: TStringField
      FieldName = 'status'
      Size = 10
    end
    object cdsControleid_monitoramento: TIntegerField
      FieldName = 'id_monitoramento'
      Required = True
    end
  end
  object dtsControle: TDataSource
    DataSet = cdsControle
    Left = 240
    Top = 176
  end
  object qryRota: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  ID,'
      '  ROTA,'
      '  CLIENTE, '
      '  ORIGEM,'
      '  DESTINO,'
      '  HORA_INICIO,'
      '  HORA_REAL,'
      '  HORA_FIM,'
      '  HORA_REAL_FIM,'
      '  COD_ATRASO,'
      '  OBS,'
      '  STATUS,'
      '  CAMINHAO,'
      '  PLACA,'
      '  MOTORISTA'
      ''
      'FROM'
      '  rota'
      '')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 232
    object qryRotaID: TIntegerField
      FieldName = 'ID'
    end
    object qryRotaROTA: TStringField
      FieldName = 'ROTA'
      Size = 10
    end
    object qryRotaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object qryRotaORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 50
    end
    object qryRotaDESTINO: TStringField
      FieldName = 'DESTINO'
      Size = 50
    end
    object qryRotaHORA_INICIO: TStringField
      FieldName = 'HORA_INICIO'
      Size = 10
    end
    object qryRotaHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
    object qryRotaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object qryRotaHORA_REAL: TStringField
      FieldName = 'HORA_REAL'
      Size = 10
    end
    object qryRotaHORA_REAL_FIM: TStringField
      FieldName = 'HORA_REAL_FIM'
      Size = 10
    end
    object qryRotaCOD_ATRASO: TStringField
      FieldName = 'COD_ATRASO'
      Size = 10
    end
    object qryRotaOBS: TStringField
      FieldName = 'OBS'
      Size = 10
    end
    object qryRotaCAMINHAO: TStringField
      FieldName = 'CAMINHAO'
      Size = 10
    end
    object qryRotaPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object qryRotaMOTORISTA: TStringField
      FieldName = 'MOTORISTA'
      Size = 10
    end
  end
  object cdsRota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRota'
    Left = 104
    Top = 240
    object cdsRotaID: TIntegerField
      FieldName = 'ID'
    end
    object cdsRotaROTA: TStringField
      FieldName = 'ROTA'
      Size = 10
    end
    object cdsRotaCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 50
    end
    object cdsRotaORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 50
    end
    object cdsRotaDESTINO: TStringField
      FieldName = 'DESTINO'
      Size = 50
    end
    object cdsRotaHORA_INICIO: TStringField
      FieldName = 'HORA_INICIO'
      Size = 10
    end
    object cdsRotaHORA_FIM: TStringField
      FieldName = 'HORA_FIM'
      Size = 10
    end
    object cdsRotaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object cdsRotaHORA_REAL: TStringField
      FieldName = 'HORA_REAL'
      Size = 10
    end
    object cdsRotaHORA_REAL_FIM: TStringField
      FieldName = 'HORA_REAL_FIM'
      Size = 10
    end
    object cdsRotaCOD_ATRASO: TStringField
      FieldName = 'COD_ATRASO'
      Size = 10
    end
    object cdsRotaOBS: TStringField
      FieldName = 'OBS'
      Size = 10
    end
    object cdsRotaCAMINHAO: TStringField
      FieldName = 'CAMINHAO'
      Size = 10
    end
    object cdsRotaPLACA: TStringField
      FieldName = 'PLACA'
      Size = 10
    end
    object cdsRotaMOTORISTA: TStringField
      FieldName = 'MOTORISTA'
      Size = 10
    end
  end
  object dspRota: TDataSetProvider
    DataSet = qryRota
    Left = 176
    Top = 240
  end
  object dtsRota: TDataSource
    DataSet = cdsRota
    Left = 240
    Top = 240
  end
  object QryAula: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM MONITORAMENTO')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 56
  end
  object dsAula: TDataSource
    DataSet = cdsAula
    Left = 232
    Top = 56
  end
  object cdsAula: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAula'
    Left = 104
    Top = 56
  end
  object dspAula: TDataSetProvider
    DataSet = QryAula
    Left = 176
    Top = 56
  end
  object dtsRelatorio: TDataSource
    DataSet = cdsRelatorio
    Left = 312
    Top = 312
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    Left = 216
    Top = 312
    object cdsRelatoriorota: TStringField
      FieldName = 'rota'
      Size = 10
    end
    object cdsRelatoriodata: TStringField
      FieldName = 'data'
      Size = 10
    end
    object cdsRelatorioatrasado: TStringField
      FieldName = 'atrasado'
      Size = 10
    end
    object cdsRelatoriocod_atraso: TStringField
      FieldName = 'cod_atraso'
      Size = 10
    end
    object cdsRelatorioobs: TStringField
      FieldName = 'obs'
      Size = 50
    end
    object cdsRelatoriodestino: TStringField
      FieldName = 'destino'
      Size = 30
    end
  end
  object dspRelatorio: TDataSetProvider
    DataSet = qryRelatorio
    Left = 120
    Top = 312
  end
  object qryRelatorio: TSQLQuery
    GetMetadata = True
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT atrasado, rota, data,cod_atraso,obs,destino  FROM monitor' +
        'amento WHERE 1 = 1')
    SQLConnection = SQLConnection1
    Left = 40
    Top = 312
    object qryRelatoriorota: TStringField
      FieldName = 'rota'
      Size = 10
    end
    object qryRelatoriodata: TStringField
      FieldName = 'data'
      Size = 10
    end
    object qryRelatorioatrasado: TStringField
      FieldName = 'atrasado'
      Size = 10
    end
    object qryRelatoriocod_atraso: TStringField
      FieldName = 'cod_atraso'
      Size = 10
    end
    object qryRelatorioobs: TStringField
      FieldName = 'obs'
      Size = 50
    end
    object qryRelatoriodestino: TStringField
      FieldName = 'destino'
      Size = 30
    end
  end
  object dspRelator: TDataSetProvider
    DataSet = qryRelator
    Left = 120
    Top = 368
  end
  object cdsRelator: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelator'
    Left = 208
    Top = 368
    object cdsRelatoratraso: TStringField
      FieldName = 'atraso'
      Size = 10
    end
    object cdsRelatorrota: TStringField
      FieldName = 'rota'
      Size = 10
    end
    object cdsRelatordata: TStringField
      FieldName = 'data'
      Size = 10
    end
    object cdsRelatorcod_atraso: TStringField
      FieldName = 'cod_atraso'
      Size = 10
    end
    object cdsRelatorobs: TStringField
      FieldName = 'obs'
      Size = 50
    end
  end
  object dstRelator: TDataSource
    DataSet = cdsRelator
    Left = 296
    Top = 368
  end
  object qryRelator: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT atraso, rota, data,cod_atraso,obs  FROM monitoramento WHE' +
        'RE 1 = 1')
    SQLConnection = SQLConnection1
    Left = 48
    Top = 376
    object qryRelatoratraso: TStringField
      FieldName = 'atraso'
      Size = 10
    end
    object qryRelatorrota: TStringField
      FieldName = 'rota'
      Size = 10
    end
    object qryRelatordata: TStringField
      FieldName = 'data'
      Size = 10
    end
    object qryRelatorcod_atraso: TStringField
      FieldName = 'cod_atraso'
      Size = 10
    end
    object qryRelatorobs: TStringField
      FieldName = 'obs'
      Size = 50
    end
  end
end

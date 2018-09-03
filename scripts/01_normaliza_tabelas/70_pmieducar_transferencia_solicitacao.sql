alter table pmieducar.transferencia_solicitacao
  add escola_destino_externa varchar;

alter table pmieducar.transferencia_solicitacao
  add ref_cod_escola_destino integer;

alter table pmieducar.transferencia_solicitacao
  add estado_escola_destino_externa varchar(60);

alter table pmieducar.transferencia_solicitacao
  add municipio_escola_destino_externa varchar(60);

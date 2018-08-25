create table if not exists modules.auditoria
(
  usuario      varchar(300),
  operacao     smallint,
  rotina       varchar(300),
  valor_antigo text,
  valor_novo   text,
  data_hora    timestamp
);

alter table modules.auditoria
  owner to postgres;

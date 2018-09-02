create table if not exists pmieducar.bloqueio_ano_letivo
(
  ref_cod_instituicao integer not null
    constraint pmieducar_bloqueio_ano_letivo_ref_cod_instituicao
    references pmieducar.instituicao,
  ref_ano             integer not null,
  data_inicio         date    not null,
  data_fim            date    not null,
  constraint pmieducar_bloqueio_ano_letivo_pkey
  primary key (ref_cod_instituicao, ref_ano)
);

alter table pmieducar.bloqueio_ano_letivo
  owner to postgres;

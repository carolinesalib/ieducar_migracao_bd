create sequence bloqueio_lancamento_faltas_notas_seq
  minvalue 0;

alter sequence bloqueio_lancamento_faltas_notas_seq
  owner to postgres;

create table if not exists pmieducar.bloqueio_lancamento_faltas_notas
(
  cod_bloqueio   integer default nextval('public.bloqueio_lancamento_faltas_notas_seq' :: regclass) not null
    constraint fk_bloqueio_lancamento_faltas_notas
    primary key,
  ano            integer                                                                            not null,
  ref_cod_escola integer                                                                            not null
    constraint bloqueio_lancamento_faltas_notas_ref_cod_escola_fkey
    references escola
    on update restrict on delete restrict,
  etapa          integer                                                                            not null,
  data_inicio    date                                                                               not null,
  data_fim       date                                                                               not null
);

alter table pmieducar.bloqueio_lancamento_faltas_notas
  owner to postgres;


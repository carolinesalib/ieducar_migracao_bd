create table if not exists pmieducar.dispensa_etapa
(
  ref_cod_dispensa integer
    constraint ref_cod_disciplina
    references pmieducar.dispensa_disciplina,
  etapa            integer
);

alter table pmieducar.dispensa_etapa
  owner to postgres;

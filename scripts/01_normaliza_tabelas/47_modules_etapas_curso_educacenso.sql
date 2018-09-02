create table if not exists modules.etapas_curso_educacenso
(
  etapa_id integer not null
    constraint etapas_curso_educacenso_etapa_fk
    references modules.etapas_educacenso,
  curso_id integer not null
    constraint etapas_curso_educacenso_curso_fk
    references pmieducar.curso,
  constraint etapas_curso_educacenso_pk
  primary key (etapa_id, curso_id)
);

alter table modules.etapas_curso_educacenso
  owner to postgres;

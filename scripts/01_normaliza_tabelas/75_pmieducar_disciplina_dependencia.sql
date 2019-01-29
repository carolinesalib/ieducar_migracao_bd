create table pmieducar.disciplina_dependencia
(
  ref_cod_matricula          integer not null
    constraint disciplina_dependencia_ref_cod_matricula_fkey
      references matricula
      on update restrict on delete restrict,
  ref_cod_disciplina         integer not null,
  ref_cod_escola             integer not null,
  ref_cod_serie              integer not null,
  observacao                 text,
  cod_disciplina_dependencia integer not null
    constraint cod_disciplina_dependencia_pkey
      primary key,
  constraint disciplina_dependencia_ref_cod_serie_fkey
    foreign key (ref_cod_serie, ref_cod_escola, ref_cod_disciplina) references escola_serie_disciplina
      on update restrict on delete restrict
);

alter table pmieducar.disciplina_dependencia
  owner to ieducar;

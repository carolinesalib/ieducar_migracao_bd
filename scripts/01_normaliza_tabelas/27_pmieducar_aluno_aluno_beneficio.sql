create table pmieducar.aluno_aluno_beneficio
(
  aluno_id           integer not null
    constraint aluno_aluno_beneficio_aluno_fk
    references pmieducar.aluno,
  aluno_beneficio_id integer not null
    constraint aluno_aluno_beneficio_aluno_beneficio_fk
    references pmieducar.aluno_beneficio,
  constraint aluno_aluno_beneficio_pk
  primary key (aluno_id, aluno_beneficio_id)
);

alter table pmieducar.aluno_aluno_beneficio
  owner to postgres;

create table pmieducar.aluno_historico_altura_peso
(
  ref_cod_aluno  integer        not null
    constraint aluno_historico_altura_peso_ref_cod_aluno_fkey
    references pmieducar.aluno,
  data_historico date           not null,
  altura         numeric(12, 2) not null,
  peso           numeric(12, 2) not null
);

alter table pmieducar.aluno_historico_altura_peso
  owner to ieducar;

create sequence pmieducar.projeto_seq;

alter sequence pmieducar.projeto_seq
  owner to ieducar;

create table pmieducar.projeto
(
  cod_projeto integer default nextval('pmieducar.projeto_seq' :: regclass) not null
    constraint pmieducar_projeto_cod_projeto
    primary key,
  nome        varchar(50),
  observacao  varchar(255)
);

alter table pmieducar.projeto
  owner to ieducar;

create table pmieducar.projeto_aluno
(
  ref_cod_projeto   integer not null
    constraint pmieducar_projeto_aluno_ref_cod_projeto
    references pmieducar.projeto,
  ref_cod_aluno     integer not null
    constraint pmieducar_projeto_aluno_ref_cod_aluno
    references pmieducar.aluno,
  data_inclusao     date,
  data_desligamento date,
  turno             integer,
  constraint pmieducar_projeto_aluno_pk
  primary key (ref_cod_projeto, ref_cod_aluno)
);

alter table pmieducar.projeto_aluno
  owner to ieducar;

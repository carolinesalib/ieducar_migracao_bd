create sequence modules.nota_geral_id_seq;

alter sequence modules.nota_geral_id_seq
  owner to postgres;

create table if not exists modules.nota_geral
(
  id               integer default nextval('modules.nota_geral_id_seq' :: regclass) not null
    constraint nota_geral_pkey
    primary key,
  nota_aluno_id    integer                                                  not null
    constraint nota_nota_geral_nota_aluno_fk
    references modules.nota_aluno
    on delete cascade,
  nota             numeric(8, 4) default 0,
  nota_arredondada varchar(10)   default 0,
  etapa            varchar(2)                                               not null
);

alter table modules.nota_geral
  owner to postgres;

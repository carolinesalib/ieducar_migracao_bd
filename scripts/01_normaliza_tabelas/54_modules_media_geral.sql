create table if not exists modules.media_geral
(
  nota_aluno_id     integer    not null
    constraint media_geral_nota_aluno_fk
    references modules.nota_aluno
    on delete cascade,
  media             numeric(8, 4) default 0,
  media_arredondada varchar(10)   default 0,
  etapa             varchar(2) not null,
  constraint media_geral_pkey
  primary key (nota_aluno_id, etapa)
);

alter table modules.media_geral
  owner to ieducar;


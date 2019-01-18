create table if not exists pmieducar.categoria_obra
(
  id          serial       not null
    constraint categoria_obra_pkey
    primary key,
  descricao   varchar(100) not null,
  observacoes varchar(300)
);

alter table pmieducar.categoria_obra
  owner to ieducar;

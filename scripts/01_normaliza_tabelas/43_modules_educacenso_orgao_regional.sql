create table if not exists modules.educacenso_orgao_regional
(
  sigla_uf varchar(2) not null,
  codigo   varchar(5) not null,
  constraint pk_educacenso_orgao_regional
  primary key (sigla_uf, codigo)
);

alter table modules.educacenso_orgao_regional
  owner to postgres;

create sequence pmieducar.distribuicao_uniforme_seq;

alter sequence pmieducar.distribuicao_uniforme_seq
  owner to postgres;

create table pmieducar.distribuicao_uniforme
(
  cod_distribuicao_uniforme integer default nextval('pmieducar.distribuicao_uniforme_seq' :: regclass) not null
    constraint distribuicao_uniforme_cod_distribuicao_uniforme_pkey
    primary key,
  ref_cod_aluno             integer                                                          not null
    constraint distribuicao_uniforme_ref_cod_aluno_fkey
    references pmieducar.aluno
    on update restrict on delete restrict,
  ano                       integer                                                          not null,
  kit_completo              boolean,
  agasalho_qtd              smallint,
  camiseta_curta_qtd        smallint,
  camiseta_longa_qtd        smallint,
  meias_qtd                 smallint,
  bermudas_tectels_qtd      smallint,
  bermudas_coton_qtd        smallint,
  tenis_qtd                 smallint,
  data                      date,
  agasalho_tm               varchar(20),
  camiseta_curta_tm         varchar(20),
  camiseta_longa_tm         varchar(20),
  meias_tm                  varchar(20),
  bermudas_tectels_tm       varchar(20),
  bermudas_coton_tm         varchar(20),
  tenis_tm                  varchar(20),
  ref_cod_escola            integer
    constraint fk_distribuicao_uniforme_escola
    references pmieducar.escola
);

alter table pmieducar.distribuicao_uniforme
  owner to postgres;

create sequence modules.regra_avaliacao_recuperacao_id_seq;

alter sequence modules.regra_avaliacao_recuperacao_id_seq
  owner to ieducar;

create table if not exists modules.regra_avaliacao_recuperacao
(
  id                   integer default nextval('modules.regra_avaliacao_recuperacao_id_seq' :: regclass) not null
    constraint regra_avaliacao_recuperacao_pkey
    primary key,
  regra_avaliacao_id   integer                                                                   not null
    constraint regra_avaliacao_regra_avaliacao_recuperacao_fk
    references modules.regra_avaliacao (id)
    on update restrict on delete restrict,
  descricao            varchar(25)                                                               not null,
  etapas_recuperadas   varchar(25)                                                               not null,
  substitui_menor_nota boolean,
  media                numeric(8, 4)                                                             not null,
  nota_maxima          numeric(8, 4)                                                             not null
);

alter table modules.regra_avaliacao_recuperacao
  owner to ieducar;

ALTER TABLE modules.regra_avaliacao ADD COLUMN tipo_recuperacao_paralela smallint default 0;
ALTER TABLE modules.regra_avaliacao ADD COLUMN media_recuperacao_paralela numeric(5, 3);
ALTER TABLE modules.regra_avaliacao ADD COLUMN nota_maxima_geral integer default 10 not null;
ALTER TABLE modules.regra_avaliacao ADD COLUMN nota_maxima_exame_final integer default 10 not null;
ALTER TABLE modules.regra_avaliacao ADD COLUMN qtd_casas_decimais integer default 2  not null;
ALTER TABLE modules.regra_avaliacao ADD COLUMN nota_geral_por_etapa smallint default 0;
ALTER TABLE modules.regra_avaliacao ADD COLUMN qtd_disciplinas_dependencia smallint default 0 not null;
ALTER TABLE modules.regra_avaliacao ADD COLUMN aprova_media_disciplina smallint default 0;
ALTER TABLE modules.regra_avaliacao ADD COLUMN reprovacao_automatica smallint default 0;
ALTER TABLE modules.regra_avaliacao ADD COLUMN definir_componente_etapa smallint;
ALTER TABLE modules.regra_avaliacao ADD COLUMN qtd_matriculas_dependencia smallint default 0 not null;
ALTER TABLE modules.regra_avaliacao ADD COLUMN nota_minima_geral integer default 0;
ALTER TABLE modules.regra_avaliacao ADD COLUMN tabela_arredondamento_id_conceitual integer;
ALTER TABLE modules.regra_avaliacao ADD COLUMN regra_diferenciada_id integer;

alter table modules.regra_avaliacao
	add constraint regra_diferenciada_fk
		foreign key (regra_diferenciada_id) references modules.regra_avaliacao (id);

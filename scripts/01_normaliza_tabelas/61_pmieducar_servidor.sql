ALTER TABLE pmieducar.servidor ADD COLUMN situacao_curso_superior_1 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN formacao_complementacao_pedagogica_1 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN codigo_curso_superior_1 integer;
ALTER TABLE pmieducar.servidor ADD COLUMN ano_inicio_curso_superior_1 numeric(4);
ALTER TABLE pmieducar.servidor ADD COLUMN ano_conclusao_curso_superior_1 numeric(4);
ALTER TABLE pmieducar.servidor ADD COLUMN instituicao_curso_superior_1 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN situacao_curso_superior_2 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN formacao_complementacao_pedagogica_2 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN codigo_curso_superior_2 integer;
ALTER TABLE pmieducar.servidor ADD COLUMN ano_inicio_curso_superior_2 numeric(4);
ALTER TABLE pmieducar.servidor ADD COLUMN ano_conclusao_curso_superior_2 numeric(4);
ALTER TABLE pmieducar.servidor ADD COLUMN instituicao_curso_superior_2 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN situacao_curso_superior_3 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN formacao_complementacao_pedagogica_3 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN codigo_curso_superior_3 integer;
ALTER TABLE pmieducar.servidor ADD COLUMN ano_inicio_curso_superior_3 numeric(4);
ALTER TABLE pmieducar.servidor ADD COLUMN ano_conclusao_curso_superior_3 numeric(4);
ALTER TABLE pmieducar.servidor ADD COLUMN instituicao_curso_superior_3 smallint;
ALTER TABLE pmieducar.servidor ADD COLUMN multi_seriado boolean;
ALTER TABLE pmieducar.servidor ADD COLUMN pos_graduacao integer [];
ALTER TABLE pmieducar.servidor ADD COLUMN curso_formacao_continuada integer [];

alter table pmieducar.servidor add constraint codigo_curso_superior_1_fk
  foreign key (codigo_curso_superior_1) references modules.educacenso_curso_superior on delete set null;

alter table pmieducar.servidor add constraint codigo_curso_superior_2_fk
  foreign key (codigo_curso_superior_2) references modules.educacenso_curso_superior on delete set null;

alter table pmieducar.servidor add constraint codigo_curso_superior_3_fk
  foreign key (codigo_curso_superior_3) references modules.educacenso_curso_superior on delete set null;

alter table pmieducar.servidor add constraint instituicao_curso_superior_1_fk
  foreign key (instituicao_curso_superior_1) references modules.educacenso_ies;

alter table pmieducar.servidor add constraint instituicao_curso_superior_2_fk
  foreign key (instituicao_curso_superior_2) references modules.educacenso_ies;

alter table pmieducar.servidor add constraint instituicao_curso_superior_3_fk
  foreign key (instituicao_curso_superior_3) references modules.educacenso_ies;
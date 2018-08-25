ALTER TABLE pmieducar.turma ADD COLUMN tipo_atendimento smallint;
ALTER TABLE pmieducar.turma ADD COLUMN turma_mais_educacao smallint;
ALTER TABLE pmieducar.turma ADD COLUMN atividade_complementar_1 integer;
ALTER TABLE pmieducar.turma ADD COLUMN atividade_complementar_2 integer;
ALTER TABLE pmieducar.turma ADD COLUMN atividade_complementar_3 integer;
ALTER TABLE pmieducar.turma ADD COLUMN atividade_complementar_4 integer;
ALTER TABLE pmieducar.turma ADD COLUMN atividade_complementar_5 integer;
ALTER TABLE pmieducar.turma ADD COLUMN atividade_complementar_6 integer;
ALTER TABLE pmieducar.turma ADD COLUMN aee_braille smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_recurso_optico smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_estrategia_desenvolvimento smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_tecnica_mobilidade smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_libras smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_caa smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_curricular smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_soroban smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_informatica smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_lingua_escrita smallint;
ALTER TABLE pmieducar.turma ADD COLUMN aee_autonomia smallint;
ALTER TABLE pmieducar.turma ADD COLUMN cod_curso_profissional integer;
ALTER TABLE pmieducar.turma ADD COLUMN etapa_educacenso smallint;
ALTER TABLE pmieducar.turma ADD COLUMN ref_cod_disciplina_dispensada integer;
ALTER TABLE pmieducar.turma ADD COLUMN parecer_1_etapa text;
ALTER TABLE pmieducar.turma ADD COLUMN parecer_2_etapa text;
ALTER TABLE pmieducar.turma ADD COLUMN parecer_3_etapa text;
ALTER TABLE pmieducar.turma ADD COLUMN parecer_4_etapa text;
ALTER TABLE pmieducar.turma ADD COLUMN nao_informar_educacenso smallint;
ALTER TABLE pmieducar.turma ADD COLUMN tipo_mediacao_didatico_pedagogico integer;
ALTER TABLE pmieducar.turma ADD COLUMN dias_semana integer [];
ALTER TABLE pmieducar.turma ADD COLUMN atividades_complementares integer [];
ALTER TABLE pmieducar.turma ADD COLUMN atividades_aee integer [];
ALTER TABLE pmieducar.turma ADD COLUMN tipo_boletim_diferenciado smallint;

alter table pmieducar.turma
  add constraint fk_turma_disciplina_dispensada
foreign key (ref_cod_disciplina_dispensada) references modules.componente_curricular (id);

-- Somente para quem utiliza versão do i-educar com multiseriado
alter table pmieducar.turma add multiseriada smallint default (0) :: smallint not null;
alter table pmieducar.turma add ref_ref_cod_serie_mult integer;
alter table pmieducar.turma add ref_ref_cod_escola_mult integer;


alter table modules.componente_curricular_turma add docente_vinculado smallint;
alter table modules.componente_curricular_turma add etapas_especificas smallint;
alter table modules.componente_curricular_turma add etapas_utilizadas varchar;
alter table modules.componente_curricular_turma add updated_at timestamp default now() not null;
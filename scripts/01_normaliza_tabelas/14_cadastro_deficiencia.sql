alter table cadastro.deficiencia
	add deficiencia_educacenso smallint;

alter table cadastro.deficiencia
	add desconsidera_regra_diferenciada boolean default false;

-- Atualiza dados
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Cegueira', deficiencia_educacenso = 1, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 2;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Baixa Visão', deficiencia_educacenso = 2, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 3;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Surdez', deficiencia_educacenso = 3, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 4;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Deficiência Auditiva', deficiencia_educacenso = 4, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 5;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Surdocegueira', deficiencia_educacenso = 5, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 6;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Deficiência Física', deficiencia_educacenso = 6, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 7;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Deficiência Mental', deficiencia_educacenso = null, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 8;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Deficiência Múltipla', deficiencia_educacenso = 8, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 9;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Autismo Clássico', deficiencia_educacenso = null, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 10;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Síndrome de Asperger', deficiencia_educacenso = null, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 11;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Síndrome de Rett', deficiencia_educacenso = null, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 12;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Transtorno desintegrativo da infância (psicose infantil)', deficiencia_educacenso = null, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 13;
UPDATE cadastro.deficiencia SET nm_deficiencia = 'Altas Habilidades/Superdotação', deficiencia_educacenso = null, desconsidera_regra_diferenciada = false WHERE cod_deficiencia = 14;
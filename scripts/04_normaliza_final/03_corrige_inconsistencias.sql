alter table modules.nota_exame alter column nota_exame type numeric(6,3);

drop view relatorio.view_componente_curricular;

alter table pmieducar.escola_serie_disciplina alter column carga_horaria type numeric(7,3);

create view relatorio.view_componente_curricular as
(SELECT escola_serie_disciplina.ref_cod_disciplina AS id,
          turma.cod_turma,
          componente_curricular.nome,
          componente_curricular.abreviatura,
          componente_curricular.ordenamento,
          componente_curricular.area_conhecimento_id,
          escola_serie_disciplina.etapas_especificas,
          escola_serie_disciplina.etapas_utilizadas,
          escola_serie_disciplina.carga_horaria
   FROM (((turma
       JOIN escola_serie_disciplina ON (((escola_serie_disciplina.ref_ref_cod_serie = turma.ref_ref_cod_serie) AND
                                         (escola_serie_disciplina.ref_ref_cod_escola = turma.ref_ref_cod_escola) AND
                                         (escola_serie_disciplina.ativo = 1))))
       JOIN componente_curricular ON (((componente_curricular.id = escola_serie_disciplina.ref_cod_disciplina) AND
                                       ((SELECT count(cct.componente_curricular_id) AS count
                                         FROM componente_curricular_turma cct
                                         WHERE (cct.turma_id = turma.cod_turma)) = 0))))
       JOIN area_conhecimento ON ((area_conhecimento.id = componente_curricular.area_conhecimento_id)))
   ORDER BY area_conhecimento.ordenamento_ac, area_conhecimento.nome, componente_curricular.ordenamento,
            componente_curricular.nome)
  UNION ALL
  (SELECT componente_curricular_turma.componente_curricular_id AS id,
          componente_curricular_turma.turma_id                 AS cod_turma,
          componente_curricular.nome,
          componente_curricular.abreviatura,
          componente_curricular.ordenamento,
          componente_curricular.area_conhecimento_id,
          componente_curricular_turma.etapas_especificas,
          componente_curricular_turma.etapas_utilizadas,
          componente_curricular_turma.carga_horaria
   FROM ((componente_curricular_turma
       JOIN componente_curricular ON ((componente_curricular.id =
                                       componente_curricular_turma.componente_curricular_id)))
       JOIN area_conhecimento ON ((area_conhecimento.id = componente_curricular.area_conhecimento_id)))
   ORDER BY area_conhecimento.ordenamento_ac, area_conhecimento.nome, componente_curricular.ordenamento,
            componente_curricular.nome);

alter table relatorio.view_componente_curricular owner to postgres;

alter table pmieducar.servidor_funcao add column matricula varchar;
create sequence pmieducar.servidor_funcao_seq;
alter table pmieducar.servidor_funcao add cod_servidor_funcao integer default nextval('servidor_funcao_seq'::regclass) not null;



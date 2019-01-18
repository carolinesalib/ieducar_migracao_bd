create schema relatorio;
alter schema relatorio owner to ieducar;

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
   FROM (((pmieducar.turma
       JOIN pmieducar.escola_serie_disciplina ON (((escola_serie_disciplina.ref_ref_cod_serie = turma.ref_ref_cod_serie) AND
                                         (escola_serie_disciplina.ref_ref_cod_escola = turma.ref_ref_cod_escola) AND
                                         (escola_serie_disciplina.ativo = 1))))
       JOIN modules.componente_curricular ON (((componente_curricular.id = escola_serie_disciplina.ref_cod_disciplina) AND
                                       ((SELECT count(cct.componente_curricular_id) AS count
                                         FROM modules.componente_curricular_turma cct
                                         WHERE (cct.turma_id = turma.cod_turma)) = 0))))
       JOIN modules.area_conhecimento ON ((area_conhecimento.id = componente_curricular.area_conhecimento_id)))
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
   FROM ((modules.componente_curricular_turma
       JOIN modules.componente_curricular ON ((componente_curricular.id =
                                       componente_curricular_turma.componente_curricular_id)))
       JOIN modules.area_conhecimento ON ((area_conhecimento.id = componente_curricular.area_conhecimento_id)))
   ORDER BY area_conhecimento.ordenamento_ac, area_conhecimento.nome, componente_curricular.ordenamento,
            componente_curricular.nome);

alter table relatorio.view_componente_curricular owner to ieducar;

create function relatorio.get_texto_sem_caracter_especial(character varying) returns character varying
	language sql
as $$
SELECT translate(public.fcn_upper($1),
                       'åáàãâäéèêëíìîïóòõôöúùüûçÿýñÅÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÝÑ',
                       'aaaaaaeeeeiiiiooooouuuucyynAAAAAAEEEEIIIIOOOOOUUUUCYN');
$$;

alter function relatorio.get_texto_sem_caracter_especial(varchar) owner to ieducar;

create function relatorio.get_texto_sem_espaco(character varying) returns character varying
	language sql
as $$
SELECT translate(public.fcn_upper(regexp_replace($1,' ','','g')), 'åáàãâäéèêëíìîïóòõôöúùüûçÿýñÅÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇÝÑ', 'aaaaaaeeeeiiiiooooouuuucyynAAAAAAEEEEIIIIOOOOOUUUUCYN');
$$;

alter function relatorio.get_texto_sem_espaco(varchar) owner to ieducar;

create function relatorio.count_weekdays(start_date date, end_date date) returns integer
	language plpgsql
as $$
DECLARE
                          tmp_date date;
                          tmp_dow integer;
                          -- double precision returned from extract
                          tot_dow integer;
                        BEGIN
                          tmp_date := start_date;
                          tot_dow := 0;

                          WHILE (tmp_date <= end_date) LOOP
                            SELECT INTO tmp_dow cast(extract(dow
                              FROM tmp_date) AS integer);

                            IF ((tmp_dow >= 2) AND (tmp_dow <= 6)) THEN
                              tot_dow := (tot_dow + 1);
                            END IF;

                            SELECT INTO tmp_date (tmp_date + interval '1 DAY ');

                          END LOOP;

                          RETURN tot_dow;
                        END;
$$;

alter function relatorio.count_weekdays(date, date) owner to ieducar;

create function relatorio.formata_nome(var text) returns text
	language sql
as $$
SELECT array_to_string(array_agg(nomes),' ')
                          FROM(
                               SELECT CASE WHEN lower(x.id_unico[i]) = 'de' THEN lower(x.id_unico[i])
                                           WHEN lower(x.id_unico[i]) = 'dos' THEN lower(x.id_unico[i])
                                           WHEN lower(x.id_unico[i]) = 'da' THEN lower(x.id_unico[i])
                                           WHEN lower(x.id_unico[i]) = 'e' THEN lower(x.id_unico[i])
                                           ELSE upper(substring(x.id_unico[i],1,1)) || lower(substring(x.id_unico[i],2))
                                            END AS nomes
                                 FROM(
                                      SELECT *
                                        FROM string_to_array(cast($1 AS text),' ') AS id_unico) AS x,
            generate_series(1,array_upper(string_to_array(cast($1 as text),' '),1)) AS i) AS x;
$$;

comment on function relatorio.formata_nome(text) is 'Função que formata um nome, colocando iniciais em maiúsculas e demais em minúsculas';

alter function relatorio.formata_nome(text) owner to ieducar;

create function relatorio.get_nome_escola(integer) returns character varying
	language sql
as $$
SELECT COALESCE(
               (SELECT COALESCE (fcn_upper(ps.nome),fcn_upper(juridica.fantasia))
            FROM cadastro.pessoa ps, cadastro.juridica
           WHERE escola.ref_idpes = juridica.idpes
             AND juridica.idpes = ps.idpes
             AND ps.idpes = escola.ref_idpes),
               (SELECT nm_escola
            FROM pmieducar.escola_complemento
           WHERE ref_cod_escola = escola.cod_escola))
          FROM pmieducar.escola
         WHERE escola.cod_escola = $1;
$$;

alter function relatorio.get_nome_escola(integer) owner to ieducar;

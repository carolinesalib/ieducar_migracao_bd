-- SearchPath
-- IMPORTANTE: não esquecer de renomear o nome do banco de dados
ALTER DATABASE nome_do_banco_de_dados SET search_path = "$user", public, portal, cadastro, acesso, alimentos, consistenciacao, historico, pmiacoes, pmicontrolesis, pmidrh, pmieducar, pmiotopic, urbano, modules;

-- Remove indice não utilizado
drop index if exists pmieducar.i_habilitacaoo_nm_tipo_asc;

-- Atualiza view funcionario
drop view portal.v_funcionario;
create view portal.v_funcionario as
  SELECT f.ref_cod_pessoa_fj,
         f.matricula,
         f.matricula_interna,
         f.senha,
         f.ativo,
         f.ramal,
         f.sequencial,
         f.opcao_menu,
         f.ref_cod_setor,
         f.ref_cod_funcionario_vinculo,
         f.tempo_expira_senha,
         f.tempo_expira_conta,
         f.data_troca_senha,
         f.data_reativa_conta,
         f.ref_ref_cod_pessoa_fj,
         f.proibido,
         f.ref_cod_setor_new,
         f.email,
         (SELECT pessoa.nome FROM cadastro.pessoa WHERE (pessoa.idpes = (f.ref_cod_pessoa_fj) :: numeric)) AS nome
  FROM portal.funcionario f;

alter table portal.v_funcionario
  owner to ieducar;

-- Adiciona função textcat_all
CREATE FUNCTION commacat_ignore_nulls(acc text, instr text) RETURNS text
    LANGUAGE plpgsql
    AS $$
  BEGIN
      IF acc IS NULL OR acc = '' THEN
        RETURN instr;
      ELSIF instr IS NULL OR instr = '' THEN
        RETURN acc || ' <br> ';
      ELSE
        RETURN acc || ' <br> ' || instr;
      END IF;
    END;
  $$;

ALTER FUNCTION public.commacat_ignore_nulls(acc text, instr text) OWNER TO ieducar;

CREATE AGGREGATE textcat_all(text) (
    SFUNC = commacat_ignore_nulls,
    STYPE = text,
    INITCOND = ''
);

ALTER AGGREGATE public.textcat_all(text) OWNER TO ieducar;

-- Adiciona extensão unaccent
CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;

-- Insere configurações gerais
INSERT INTO pmieducar.configuracoes_gerais (ref_cod_instituicao, permite_relacionamento_posvendas) VALUES (1, 1);

CREATE FUNCTION public.isnumeric(text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $_$
  DECLARE x NUMERIC;
    BEGIN
        x = $1::NUMERIC;
        RETURN TRUE;
    EXCEPTION WHEN others THEN
        RETURN FALSE;
    END;
  $_$;

CREATE FUNCTION public.verifica_existe_matricula_posterior_mesma_turma(cod_matricula integer, cod_turma integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
                      DECLARE existe_matricula boolean;

                      BEGIN
                        existe_matricula := EXISTS (SELECT *
                                                      FROM pmieducar.matricula_turma mt
                                                     INNER JOIN pmieducar.matricula m ON (m.cod_matricula = mt.ref_cod_matricula)
                                                     INNER JOIN pmieducar.matricula m2 ON (m2.cod_matricula = m.cod_matricula)
                                                     INNER JOIN pmieducar.matricula_turma mt2 ON (mt2.ref_cod_matricula = m.cod_matricula
                                                                                                  AND mt2.ref_cod_turma = cod_turma)
                                                     WHERE mt.ref_cod_turma = mt2.ref_cod_turma
                                                       AND mt.ref_cod_matricula <> mt2.ref_cod_matricula
                                                       AND m.ref_cod_aluno = m2.ref_cod_aluno
                                                       AND mt.data_enturmacao > mt2.data_enturmacao
                                                       AND m.ativo = 1
                                                       AND m2.ativo = 1);

                        RETURN existe_matricula;
                      END;
                      $$;

CREATE FUNCTION public.formata_cpf(cpf numeric) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
DECLARE
	cpf_formatado varchar := '';
BEGIN
  cpf_formatado := (SUBSTR(TO_CHAR(cpf, '00000000000'), 1, 4) || '.' ||
		    		SUBSTR(TO_CHAR(cpf, '00000000000'), 5, 3) || '.' ||
		    		SUBSTR(TO_CHAR(cpf, '00000000000'), 8, 3) || '-' ||
		    		SUBSTR(TO_CHAR(cpf, '00000000000'), 11, 2)) ;
  RETURN cpf_formatado;
END;
$$;

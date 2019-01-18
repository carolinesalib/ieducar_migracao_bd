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

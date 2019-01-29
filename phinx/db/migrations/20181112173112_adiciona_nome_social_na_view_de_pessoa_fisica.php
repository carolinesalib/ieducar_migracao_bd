<?php

use Phinx\Migration\AbstractMigration;

class AdicionaNomeSocialNaViewDePessoaFisica extends AbstractMigration
{
    public function change()
    {
        $this->execute("DROP VIEW diario.v_mensagens;");
        $this->execute("DROP VIEW professor.matricula");

        $this->execute("DROP VIEW cadastro.v_pessoa_fisica;");
        $this->execute("
            CREATE OR REPLACE VIEW cadastro.v_pessoa_fisica AS 
                SELECT p.idpes,
                p.nome,
                p.url,
                p.email,
                p.situacao,
                f.nome_social,
                f.data_nasc,
                f.sexo,
                f.cpf,
                f.ref_cod_sistema,
                f.idesco,
                f.ativo
                FROM cadastro.pessoa p,
                cadastro.fisica f
                WHERE p.idpes = f.idpes;
         ");
         $this->execute("ALTER TABLE cadastro.v_pessoa_fisica OWNER TO ieducar;");

         $this->execute("
            create view diario.v_mensagens as
            SELECT m.id,
                    m.id_user_de,
                    m.id_user_para,
                    m.assunto,
                    m.mensagem,
                    m.lida,
                    m.created_at,
                    m.updated_at,
                    pf.nome  AS nm_de,
                    pf2.nome AS nm_para
            FROM ((((diario.mensagens m
            JOIN users de ON ((m.id_user_de = de.id)))
            JOIN users para ON ((m.id_user_para = para.id)))
            LEFT JOIN cadastro.v_pessoa_fisica pf ON (((de.ref_idpes)::numeric = pf.idpes)))
                    LEFT JOIN cadastro.v_pessoa_fisica pf2 ON (((para.ref_idpes)::numeric = pf2.idpes)))
            ORDER BY m.created_at;
            
            alter table diario.v_mensagens
            owner to ieducar;");

        $this->execute("
        create view professor.matricula as
        SELECT pf.idpes,
            pf.nome,
            t.nm_turma,
            t.ano,
            mt.ref_cod_matricula,
            mt.ref_cod_turma,
            mt.sequencial,
            mt.ref_usuario_exc,
            mt.ref_usuario_cad,
            mt.data_cadastro,
            mt.data_exclusao,
            mt.ativo,
            mt.data_enturmacao,
            mt.sequencial_fechamento
        FROM ((((pmieducar.matricula_turma mt
        JOIN pmieducar.matricula m ON ((mt.ref_cod_matricula = m.cod_matricula)))
        JOIN pmieducar.turma t ON ((mt.ref_cod_turma = t.cod_turma)))
        JOIN pmieducar.aluno a ON ((m.ref_cod_aluno = a.cod_aluno)))
            JOIN cadastro.v_pessoa_fisica pf ON (((a.ref_idpes)::numeric = pf.idpes)))
        WHERE ((mt.ativo = 1) AND (a.ativo = 1) AND (t.ativo = 1));

        comment on view professor.matricula is 'retorna todos os alunos com matriculas ativas';

        alter table professor.matricula
        owner to ieducar;
        ");
    }
}

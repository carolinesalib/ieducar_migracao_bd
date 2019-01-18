<?php

use Phinx\Migration\AbstractMigration;

class AlteraFuncaoFrequenciaPorComponente extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function change()
    {
        $sql = <<<'SQL'
            CREATE OR REPLACE FUNCTION modules.frequencia_por_componente(cod_matricula_id integer, cod_disciplina_id integer, cod_turma_id integer)
                RETURNS character varying
            LANGUAGE plpgsql
            AS $$
            DECLARE
                                         cod_falta_aluno_id integer;
                                         v_qtd_dias_letivos_serie integer;
                                         v_total_faltas integer;
                                         qtde_carga_horaria integer;
                                         v_hora_falta float;
                                         cod_serie_id integer;
                                      BEGIN
            
                                        cod_falta_aluno_id := (SELECT id FROM modules.falta_aluno WHERE matricula_id = cod_matricula_id ORDER BY id DESC LIMIT 1);
            
                                        qtde_carga_horaria := (SELECT carga_horaria :: int
                                              FROM modules.componente_curricular_turma
                                             WHERE componente_curricular_turma.componente_curricular_id = cod_disciplina_id
                                               AND componente_curricular_turma.turma_id = cod_turma_id);
            
                                        IF (qtde_carga_horaria IS NULL) THEN
                                            cod_serie_id := (SELECT ref_ref_cod_serie FROM pmieducar.turma WHERE cod_turma = cod_turma_id);
                                            qtde_carga_horaria := (SELECT carga_horaria :: int
                                                                 FROM modules.componente_curricular_ano_escolar
                                                            WHERE componente_curricular_ano_escolar.componente_curricular_id = cod_disciplina_id
                                                              AND componente_curricular_ano_escolar.ano_escolar_id = cod_serie_id);
                                        END IF;
            
                                        v_total_faltas := (SELECT SUM(quantidade)
                                                             FROM falta_componente_curricular
                                                            WHERE falta_aluno_id = cod_falta_aluno_id
                                                              AND componente_curricular_id = cod_disciplina_id);
            
                                        v_hora_falta := (SELECT hora_falta FROM pmieducar.curso c
                                                     INNER JOIN pmieducar.matricula m ON (c.cod_curso = m.ref_cod_curso)
                                                          WHERE m.cod_matricula = cod_matricula_id);
            
                                        IF (qtde_carga_horaria = 0) THEN
                                            RETURN 0;
                                        END IF;
            
                                        RETURN  trunc((100 - ((v_total_faltas * (v_hora_falta*100))/qtde_carga_horaria))::numeric, 2);
            
                                    END;
            $$;
SQL;
        $this->execute($sql);

    }
}

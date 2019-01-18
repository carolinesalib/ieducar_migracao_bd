<?php

use Phinx\Migration\AbstractMigration;

class CriaTriggerAuditaNotaComponenteCurricularMedia extends AbstractMigration
{
    public function change()
    {
        $sql = <<<'SQL'
CREATE OR REPLACE FUNCTION modules.audita_nota_componente_curricular_media() RETURNS TRIGGER AS $trigger_audita_nota_componente_curricular_media$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 3, 'TRIGGER_NOTA_COMPONENTE_CURRICULAR_MEDIA', TO_JSON(OLD.*),NULL,NOW(),json_build_object('nota_aluno_id', OLD.nota_aluno_id, 'componente_curricular_id',OLD.componente_curricular_id, 'etapa',OLD.etapa),nextval('auditoria_geral_id_seq'),current_query());
            RETURN OLD;
        END IF;    
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 2, 'TRIGGER_NOTA_COMPONENTE_CURRICULAR_MEDIA', TO_JSON(OLD.*),TO_JSON(NEW.*),NOW(),json_build_object('nota_aluno_id', NEW.nota_aluno_id, 'componente_curricular_id',OLD.componente_curricular_id, 'etapa',OLD.etapa),nextval('auditoria_geral_id_seq'),current_query());
            RETURN NEW;
        END IF;    
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 1, 'TRIGGER_NOTA_COMPONENTE_CURRICULAR_MEDIA', NULL,TO_JSON(NEW.*),NOW(),json_build_object('nota_aluno_id', NEW.nota_aluno_id, 'componente_curricular_id',NEW.componente_curricular_id, 'etapa',NEW.etapa),nextval('auditoria_geral_id_seq'),current_query());
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$trigger_audita_nota_componente_curricular_media$ language plpgsql;

CREATE TRIGGER trigger_audita_nota_componente_curricular_media
AFTER INSERT OR UPDATE OR DELETE ON modules.nota_componente_curricular_media
    FOR EACH ROW EXECUTE PROCEDURE audita_nota_componente_curricular_media();
SQL;

        $this->execute($sql);
    }
}

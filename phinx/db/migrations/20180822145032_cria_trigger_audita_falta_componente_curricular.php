<?php

use Phinx\Migration\AbstractMigration;

class CriaTriggerAuditaFaltaComponenteCurricular extends AbstractMigration
{
    public function change()
    {
        $sql = <<<'SQL'
CREATE OR REPLACE FUNCTION modules.audita_falta_componente_curricular() RETURNS TRIGGER AS $trigger_audita_falta_componente_curricular$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 3, 'TRIGGER_FALTA_COMPONENTE_CURRICULAR', TO_JSON(OLD.*),NULL,NOW(),OLD.id ,nextval('auditoria_geral_id_seq'),current_query());
            RETURN OLD;
        END IF;    
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 2, 'TRIGGER_FALTA_COMPONENTE_CURRICULAR', TO_JSON(OLD.*),TO_JSON(NEW.*),NOW(),NEW.id,nextval('auditoria_geral_id_seq'),current_query());
            RETURN NEW;
        END IF;    
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 1, 'TRIGGER_FALTA_COMPONENTE_CURRICULAR', NULL,TO_JSON(NEW.*),NOW(),NEW.id,nextval('auditoria_geral_id_seq'),current_query());
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$trigger_audita_falta_componente_curricular$ language plpgsql;

CREATE TRIGGER trigger_audita_falta_componente_curricular
AFTER INSERT OR UPDATE OR DELETE ON modules.falta_componente_curricular
    FOR EACH ROW EXECUTE PROCEDURE audita_falta_componente_curricular();
SQL;

        $this->execute($sql);
    }
}

<?php

use Phinx\Migration\AbstractMigration;

class CriaTriggerAuditaParecerGeral extends AbstractMigration
{
    public function change()
    {
        $sql = <<<'SQL'
CREATE OR REPLACE FUNCTION modules.audita_parecer_geral() RETURNS TRIGGER AS $trigger_audita_parecer_geral$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 3, 'TRIGGER_PARECER_GERAL', TO_JSON(OLD.*),NULL,NOW(),OLD.id,nextval('auditoria_geral_id_seq'),current_query());
            RETURN OLD;
        END IF;    
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 2, 'TRIGGER_PARECER_GERAL', TO_JSON(OLD.*),TO_JSON(NEW.*),NOW(),NEW.id,nextval('auditoria_geral_id_seq'),current_query());
            RETURN NEW;
        END IF;    
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO modules.auditoria_geral VALUES(1, 1, 'TRIGGER_PARECER_GERAL', NULL,TO_JSON(NEW.*),NOW(),NEW.id,nextval('auditoria_geral_id_seq'),current_query());
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$trigger_audita_parecer_geral$ language plpgsql;

CREATE TRIGGER trigger_audita_parecer_geral
AFTER INSERT OR UPDATE OR DELETE ON modules.parecer_geral
    FOR EACH ROW EXECUTE PROCEDURE audita_parecer_geral();
SQL;

        $this->execute($sql);
    }
}

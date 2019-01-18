ALTER TABLE pmieducar.matricula_turma ADD COLUMN reclassificado boolean;
ALTER TABLE pmieducar.matricula_turma ADD COLUMN abandono boolean;
ALTER TABLE pmieducar.matricula_turma ADD COLUMN updated_at timestamp;
ALTER TABLE pmieducar.matricula_turma ADD COLUMN falecido boolean;
ALTER TABLE pmieducar.matricula_turma ADD COLUMN etapa_educacenso smallint;
ALTER TABLE pmieducar.matricula_turma ADD COLUMN turma_unificada smallint;

create or replace function pmieducar.updated_at_matricula_turma()
  returns trigger
language plpgsql
as $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

alter function pmieducar.updated_at_matricula_turma()
  owner to ieducar;

CREATE TRIGGER trigger_updated_at_matricula_turma BEFORE UPDATE ON pmieducar.matricula_turma FOR EACH ROW EXECUTE PROCEDURE pmieducar.updated_at_matricula_turma();

ALTER TABLE pmieducar.matricula ADD COLUMN ref_cod_abandono_tipo integer;
ALTER TABLE pmieducar.matricula ADD COLUMN turno_pre_matricula smallint;
ALTER TABLE pmieducar.matricula ADD COLUMN dependencia boolean  default false;
ALTER TABLE pmieducar.matricula ADD COLUMN updated_at timestamp;
ALTER TABLE pmieducar.matricula ADD COLUMN saida_escola boolean  default false;
ALTER TABLE pmieducar.matricula ADD COLUMN data_saida_escola date;
ALTER TABLE pmieducar.matricula ADD COLUMN turno_id integer;

alter table pmieducar.matricula
  add constraint fk_matricula_abandono_tipo
foreign key (ref_cod_abandono_tipo) references abandono_tipo;

create or replace function pmieducar.updated_at_matricula()
  returns trigger
language plpgsql
as $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

alter function pmieducar.updated_at_matricula()
  owner to postgres;

CREATE TRIGGER trigger_updated_at_matricula BEFORE UPDATE ON matricula FOR EACH ROW EXECUTE PROCEDURE updated_at_matricula();
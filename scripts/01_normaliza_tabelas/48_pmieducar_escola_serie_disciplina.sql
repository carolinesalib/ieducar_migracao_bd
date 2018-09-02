alter table pmieducar.escola_serie_disciplina add etapas_especificas smallint;
alter table pmieducar.escola_serie_disciplina add etapas_utilizadas varchar;
alter table pmieducar.escola_serie_disciplina add updated_at timestamp default now() not null;

create or replace function public.update_updated_at()
  returns trigger
language plpgsql
as $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

alter function public.update_updated_at()
  owner to postgres;

create trigger update_escola_serie_disciplina_updated_at
  before update
  on pmieducar.escola_serie_disciplina
  for each row
execute procedure public.update_updated_at();
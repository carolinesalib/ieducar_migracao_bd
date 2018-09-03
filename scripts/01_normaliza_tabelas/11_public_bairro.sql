alter table bairro
  add iddis integer;

alter table bairro
  add constraint fk_bairro_distrito
foreign key (iddis) references distrito;

alter table bairro
	add idsetorbai numeric(6);

alter table bairro
	add constraint bairro_idsetorbai_fk
		foreign key (idsetorbai) references setor_bai;

-- Relaciona com distrito
update public.bairro
set iddis = (select iddis
             from public.distrito
             where distrito.idmun = bairro.idmun);

-- Adiciona not null na coluna iddis
alter table public.bairro alter column iddis set not null;
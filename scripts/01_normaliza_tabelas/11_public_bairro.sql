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
create table pmieducar.auditoria_nota_dispensa
(
	id serial not null
		constraint auditoria_nota_dispensa_pkey
			primary key,
	ref_cod_matricula integer not null
		constraint auditoria_nota_dispensa_ref_cod_matricula_fkey
			references matricula,
	ref_cod_componente_curricular integer not null
		constraint auditoria_nota_dispensa_ref_cod_componente_curricular_fkey
			references modules.componente_curricular (id),
	nota numeric(8,4) not null,
	etapa integer not null,
	nota_recuperacao varchar(10),
	nota_recuperacao_especifica varchar(10),
	data_cadastro timestamp not null
);

alter table pmieducar.auditoria_nota_dispensa owner to ieducar;
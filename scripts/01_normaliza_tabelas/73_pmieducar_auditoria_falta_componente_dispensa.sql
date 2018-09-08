create table pmieducar.auditoria_falta_componente_dispensa
(
	id serial not null
		constraint auditoria_falta_componente_dispensa_pkey
			primary key,
	ref_cod_matricula integer not null
		constraint auditoria_falta_componente_dispensa_ref_cod_matricula_fkey
			references matricula,
	ref_cod_componente_curricular integer not null
		constraint auditoria_falta_componente_di_ref_cod_componente_curricula_fkey
			references modules.componente_curricular (id),
	quantidade integer not null,
	etapa integer not null,
	data_cadastro timestamp not null
)
;

alter table pmieducar.auditoria_falta_componente_dispensa owner to ieducar
;
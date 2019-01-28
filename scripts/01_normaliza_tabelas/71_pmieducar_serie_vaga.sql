create table pmieducar.serie_vaga
(
	ano integer not null,
	cod_serie_vaga integer not null
		constraint cod_serie_vaga_pkey
			primary key,
	ref_cod_instituicao integer not null
		constraint serie_vaga_ref_cod_instituicao_fk
			references pmieducar.instituicao
				on update restrict on delete restrict,
	ref_cod_escola integer not null
		constraint serie_vaga_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	ref_cod_curso integer not null
		constraint serie_vaga_ref_cod_curso_fk
			references pmieducar.curso
				on update restrict on delete restrict,
	ref_cod_serie integer not null
		constraint serie_vaga_ref_cod_serie_fk
			references pmieducar.serie
				on update restrict on delete restrict,
	vagas smallint not null,
	turno smallint default 1 not null,
	constraint cod_serie_vaga_unique
		unique (ano, ref_cod_instituicao, ref_cod_escola, ref_cod_curso, ref_cod_serie, turno)
);

alter table pmieducar.serie_vaga owner to ieducar;

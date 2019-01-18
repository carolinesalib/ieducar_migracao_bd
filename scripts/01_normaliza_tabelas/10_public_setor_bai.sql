create table setor_bai
(
	idsetorbai numeric(6) default nextval(('public.seq_setor_bai'::text)::regclass) not null
		constraint pk_setorbai
			primary key,
	nome varchar(80) not null
);

alter table setor_bai owner to ieducar;

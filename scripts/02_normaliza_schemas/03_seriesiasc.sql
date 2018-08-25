create schema serieciasc;

alter schema serieciasc owner to postgres;

create table serieciasc.aluno_cod_aluno
(
	cod_aluno integer not null
		constraint aluno_cod_aluno_cod_aluno_fk
			references pmieducar.aluno
				on update restrict on delete restrict,
	cod_ciasc bigint not null,
	user_id integer,
	created_at timestamp not null,
	updated_at timestamp,
	constraint cod_aluno_serie_ref_cod_aluno_pk
		primary key (cod_aluno, cod_ciasc)
);

alter table serieciasc.aluno_cod_aluno owner to postgres;

create table serieciasc.aluno_uniforme
(
	ref_cod_aluno integer not null
		constraint aluno_uniforme_ref_cod_aluno_fkey
			references pmieducar.aluno
				on update restrict on delete restrict,
	data_recebimento timestamp not null,
	camiseta char(2),
	quantidade_camiseta integer,
	bermuda char(2),
	quantidade_bermuda integer,
	jaqueta char(2),
	quantidade_jaqueta integer,
	calca char(2),
	quantidade_calca integer,
	meia char(2),
	quantidade_meia integer,
	tenis char(2),
	quantidade_tenis integer,
	created_at timestamp not null,
	updated_at timestamp,
	constraint aluno_uniforme_ref_cod_aluno_pk
		primary key (ref_cod_aluno, data_recebimento)
);

alter table serieciasc.aluno_uniforme owner to postgres;

create table serieciasc.escola_agua
(
	ref_cod_escola integer not null
		constraint escola_agua_ref_cod_escola_pk
			primary key
		constraint escola_agua_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	rede_publica integer default 0,
	poco_artesiano integer default 0,
	cisterna integer default 0,
	fonte_rio integer default 0,
	inexistente integer default 0,
	created_at timestamp not null,
	updated_at timestamp
);

alter table serieciasc.escola_agua owner to postgres;

create table serieciasc.escola_energia
(
	ref_cod_escola integer not null
		constraint escola_energia_ref_cod_escola_pk
			primary key
		constraint escola_energia_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	rede_publica integer default 0,
	gerador_proprio integer default 0,
	solar integer default 0,
	eolica integer default 0,
	inexistente integer default 0,
	created_at timestamp not null,
	updated_at timestamp
);

alter table serieciasc.escola_energia owner to postgres;

create table serieciasc.escola_lingua_indigena
(
	ref_cod_escola integer not null
		constraint escola_lingua_indigena_pk
			primary key
		constraint escola_lingua_indigena_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	educacao_indigena integer default 0,
	lingua_indigena integer default 0,
	lingua_portuguesa integer default 0,
	materiais_especificos integer default 0,
	ue_terra_indigena integer default 0,
	created_at timestamp not null,
	updated_at timestamp
);

alter table serieciasc.escola_lingua_indigena owner to postgres;

create table serieciasc.escola_lixo
(
	ref_cod_escola integer not null
		constraint escola_lixo_ref_cod_escola_pk
			primary key
		constraint escola_lixo_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	coleta integer default 0,
	queima integer default 0,
	outra_area integer default 0,
	recicla integer default 0,
	reutiliza integer default 0,
	enterra integer default 0,
	created_at timestamp not null,
	updated_at timestamp
);

alter table serieciasc.escola_lixo owner to postgres;

create table serieciasc.escola_projeto
(
	ref_cod_escola integer not null
		constraint escola_projeto_ref_cod_escola_pk
			primary key
		constraint escola_projeto_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	danca integer default 0,
	folclorico integer default 0,
	teatral integer default 0,
	ambiental integer default 0,
	coral integer default 0,
	fanfarra integer default 0,
	artes_plasticas integer default 0,
	integrada integer default 0,
	ambiente_alimentacao integer default 0,
	created_at timestamp not null,
	updated_at timestamp
);

alter table serieciasc.escola_projeto owner to postgres;

create table serieciasc.escola_regulamentacao
(
	ref_cod_escola integer not null
		constraint educacenso_ref_cod_escola_pk
			primary key
		constraint escola_regulamentacao_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	regulamentacao integer default 1 not null,
	situacao integer default 1 not null,
	data_criacao date,
	ato_criacao integer default 0,
	numero_ato_criacao varchar(20),
	data_ato_criacao date,
	ato_paralizacao integer default 0,
	numero_ato_paralizacao varchar(20),
	data_ato_paralizacao date,
	data_extincao date,
	ato_extincao integer default 0,
	numero_ato_extincao varchar(20),
	data_ato_extincao date,
	created_at timestamp not null,
	updated_at timestamp
);

alter table serieciasc.escola_regulamentacao owner to postgres;

create table serieciasc.escola_sanitario
(
	ref_cod_escola integer not null
		constraint escola_sanitario_ref_cod_escola_pk
			primary key
		constraint escola_sanitario_ref_cod_escola_fk
			references pmieducar.escola
				on update restrict on delete restrict,
	rede_publica integer default 0,
	fossa integer default 0,
	inexistente integer default 0,
	created_at timestamp not null,
	updated_at timestamp
);

alter table serieciasc.escola_sanitario owner to postgres;

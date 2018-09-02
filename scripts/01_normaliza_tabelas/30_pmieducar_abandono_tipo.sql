create sequence pmieducar.abandono_tipo_cod_abandono_tipo_seq
  minvalue 0;

alter sequence pmieducar.abandono_tipo_cod_abandono_tipo_seq
  owner to postgres;

create table pmieducar.abandono_tipo
(
  cod_abandono_tipo   integer default nextval('pmieducar.abandono_tipo_cod_abandono_tipo_seq' :: regclass) not null
    constraint pk_cod_abandono_tipo
    primary key,
  ref_cod_instituicao integer                                                                    not null
    constraint fk_abandono_tipo_instituicao
    references pmieducar.instituicao,
  ref_usuario_exc     integer
    constraint fk_abandono_tipo_usuario_exc
    references pmieducar.usuario,
  ref_usuario_cad     integer
    constraint fk_abandono_tipo_usuario_cad
    references pmieducar.usuario,
  nome                varchar(255)                                                               not null,
  data_cadastro       timestamp,
  data_exclusao       timestamp,
  ativo               integer
);

alter table pmieducar.abandono_tipo
  owner to postgres;

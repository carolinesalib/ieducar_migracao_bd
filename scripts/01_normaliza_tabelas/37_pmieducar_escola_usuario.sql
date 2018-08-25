create table if not exists pmieducar.escola_usuario
(
  id              serial  not null
    constraint escola_usuario_pkey
    primary key,
  ref_cod_usuario integer not null
    constraint escola_usuario_ref_cod_usuario_fkey
    references pmieducar.usuario,
  ref_cod_escola  integer not null
    constraint escola_usuario_ref_cod_escola_fkey
    references pmieducar.escola,
  escola_atual    integer
);

alter table pmieducar.escola_usuario
  owner to ieducar;

CREATE SEQUENCE pmieducar.instituicao_documentacao_seq
    START WITH 2
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


create table pmieducar.instituicao_documentacao
(
  id               integer default nextval('pmieducar.instituicao_documentacao_seq'::regclass) not null
    constraint instituicao_documentacao_pkey
      primary key,
  instituicao_id   integer                                                                     not null
    constraint instituicao_id_fkey
      references instituicao
      on update restrict on delete restrict,
  titulo_documento varchar(100)                                                                not null,
  url_documento    varchar(255)                                                                not null,
  ref_usuario_cad  integer default 0                                                           not null,
  ref_cod_escola   integer
);

alter table pmieducar.instituicao_documentacao
  owner to ieducar;

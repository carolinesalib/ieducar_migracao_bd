create table modules.auditoria_geral
(
  usuario_id   integer,
  operacao     smallint,
  rotina       varchar(50),
  valor_antigo json,
  valor_novo   json,
  data_hora    timestamp,
  codigo       varchar,
  id           serial not null
    constraint auditoria_geral_pkey
      primary key,
  query        text
);

alter table modules.auditoria_geral
  owner to ieducar;

CREATE SEQUENCE modules.auditoria_geral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE modules.auditoria_geral_id_seq OWNED BY modules.auditoria_geral.id;

CREATE TABLE modules.auditoria_geral (
    usuario_id integer,
    operacao smallint,
    rotina character varying(50),
    valor_antigo json,
    valor_novo json,
    data_hora timestamp without time zone,
    codigo character varying,
    id integer NOT NULL,
    query text
);

CREATE SEQUENCE modules.auditoria_geral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE modules.auditoria_geral_id_seq OWNED BY modules.auditoria_geral.id;

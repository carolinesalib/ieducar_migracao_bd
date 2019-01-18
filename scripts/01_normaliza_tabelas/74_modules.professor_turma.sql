CREATE SEQUENCE modules.professor_turma_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


SET default_with_oids = false;

CREATE TABLE modules.professor_turma (
    id integer DEFAULT nextval('modules.professor_turma_id_seq'::regclass) NOT NULL,
    ano smallint NOT NULL,
    instituicao_id integer NOT NULL,
    turma_id integer NOT NULL,
    servidor_id integer NOT NULL,
    funcao_exercida smallint NOT NULL,
    tipo_vinculo smallint,
    permite_lancar_faltas_componente integer DEFAULT 0,
    updated_at timestamp without time zone
);

CREATE TABLE modules.professor_turma_disciplina (
    professor_turma_id integer NOT NULL,
    componente_curricular_id integer NOT NULL
);

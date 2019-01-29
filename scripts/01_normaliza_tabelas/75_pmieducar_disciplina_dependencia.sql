CREATE TABLE pmieducar.disciplina_dependencia (
    ref_cod_matricula integer NOT NULL,
    ref_cod_disciplina integer NOT NULL,
    ref_cod_escola integer NOT NULL,
    ref_cod_serie integer NOT NULL,
    observacao text,
    cod_disciplina_dependencia integer NOT NULL
);

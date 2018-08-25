create table if not exists modules.etapas_educacenso
(
  id   integer not null
    constraint etapas_educacenso_pk
    primary key,
  nome varchar(255)
);

alter table modules.etapas_educacenso
  owner to postgres;

INSERT INTO modules.etapas_educacenso (id, nome) VALUES (1, 'Educação Infantil - Creche (0 a 3 anos)');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (2, 'Educação Infantil - Pré-escola (4 a 5 anos)');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (3, 'Ensino Fundamental 8 anos');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (4, 'Ensino Fundamental 9 anos');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (5, 'Ensino médio - Médio');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (6, 'Ensino médio - Integrado');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (7, 'Ensino médio - Normal/Magistério');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (8, 'Ensino médio - Educação profissional');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (9, 'EJA - Ensino fundamental');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (10, 'EJA - Ensino médio');
INSERT INTO modules.etapas_educacenso (id, nome) VALUES (11, 'EJA - Ensino fundamental - Projovem (urbano)');
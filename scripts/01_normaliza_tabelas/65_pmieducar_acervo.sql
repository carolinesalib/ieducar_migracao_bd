ALTER TABLE pmieducar.acervo ADD COLUMN dimencao varchar(255);
ALTER TABLE pmieducar.acervo ADD COLUMN material_ilustrativo varchar(255);
ALTER TABLE pmieducar.acervo ADD COLUMN dimencao_ilustrativo varchar(255);
ALTER TABLE pmieducar.acervo ADD COLUMN local varchar(255);
ALTER TABLE pmieducar.acervo ADD COLUMN ref_cod_tipo_autor integer;
ALTER TABLE pmieducar.acervo ADD COLUMN tipo_autor varchar(255);

ALTER TABLE pmieducar.acervo ALTER COLUMN isbn TYPE varchar(255);
ALTER TABLE pmieducar.acervo ALTER COLUMN ano TYPE varchar(25);

ALTER TABLE pmieducar.acervo ALTER COLUMN volume DROP NOT NULL;
ALTER TABLE pmieducar.acervo ALTER COLUMN num_edicao DROP NOT NULL;
ALTER TABLE pmieducar.acervo ALTER COLUMN num_paginas DROP NOT NULL;
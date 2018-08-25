alter table cadastro.raca
  add raca_educacenso smallint;

-- Atualiza dados
UPDATE cadastro.raca SET idpes_exc = null, idpes_cad = 1, nm_raca = 'Branca', data_cadastro = '2010-12-22 17:09:31.640000', data_exclusao = null, ativo = true, raca_educacenso = 1 WHERE cod_raca = 1;
UPDATE cadastro.raca SET idpes_exc = null, idpes_cad = 1, nm_raca = 'Preta', data_cadastro = '2010-12-22 17:09:31.640000', data_exclusao = null, ativo = true, raca_educacenso = 2 WHERE cod_raca = 2;
UPDATE cadastro.raca SET idpes_exc = null, idpes_cad = 1, nm_raca = 'Parda', data_cadastro = '2010-12-22 17:09:31.640000', data_exclusao = null, ativo = true, raca_educacenso = 3 WHERE cod_raca = 3;
UPDATE cadastro.raca SET idpes_exc = null, idpes_cad = 1, nm_raca = 'Amarela', data_cadastro = '2010-12-22 17:09:31.640000', data_exclusao = null, ativo = true, raca_educacenso = 4 WHERE cod_raca = 4;
UPDATE cadastro.raca SET idpes_exc = null, idpes_cad = 1, nm_raca = 'Indígena', data_cadastro = '2010-12-22 17:09:31.640000', data_exclusao = null, ativo = true, raca_educacenso = 5 WHERE cod_raca = 5;
UPDATE cadastro.raca SET idpes_exc = null, idpes_cad = 1, nm_raca = 'Não Declarada', data_cadastro = '2010-12-22 17:09:31.640000', data_exclusao = null, ativo = true, raca_educacenso = 0 WHERE cod_raca = 6;

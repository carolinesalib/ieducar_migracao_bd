alter table public.uf
  add cod_ibge integer;

-- Atualiza todos as UFs
UPDATE public.uf SET nome = 'Rondônia', geom = null, idpais = 45, cod_ibge = 11 WHERE sigla_uf = 'RO';
UPDATE public.uf SET nome = 'Acre', geom = null, idpais = 45, cod_ibge = 12 WHERE sigla_uf = 'AC';
UPDATE public.uf SET nome = 'Amazonas', geom = null, idpais = 45, cod_ibge = 13 WHERE sigla_uf = 'AM';
UPDATE public.uf SET nome = 'Roraima', geom = null, idpais = 45, cod_ibge = 14 WHERE sigla_uf = 'RR';
UPDATE public.uf SET nome = 'Pará', geom = null, idpais = 45, cod_ibge = 15 WHERE sigla_uf = 'PA';
UPDATE public.uf SET nome = 'Amapá', geom = null, idpais = 45, cod_ibge = 16 WHERE sigla_uf = 'AP';
UPDATE public.uf SET nome = 'Tocantins', geom = null, idpais = 45, cod_ibge = 17 WHERE sigla_uf = 'TO';
UPDATE public.uf SET nome = 'Maranhão', geom = null, idpais = 45, cod_ibge = 21 WHERE sigla_uf = 'MA';
UPDATE public.uf SET nome = 'Piauí', geom = null, idpais = 45, cod_ibge = 22 WHERE sigla_uf = 'PI';
UPDATE public.uf SET nome = 'Ceará', geom = null, idpais = 45, cod_ibge = 23 WHERE sigla_uf = 'CE';
UPDATE public.uf SET nome = 'Rio Grande do Norte', geom = null, idpais = 45, cod_ibge = 24 WHERE sigla_uf = 'RN';
UPDATE public.uf SET nome = 'Paraíba', geom = null, idpais = 45, cod_ibge = 25 WHERE sigla_uf = 'PB';
UPDATE public.uf SET nome = 'Pernambuco', geom = null, idpais = 45, cod_ibge = 26 WHERE sigla_uf = 'PE';
UPDATE public.uf SET nome = 'Alagoas', geom = null, idpais = 45, cod_ibge = 27 WHERE sigla_uf = 'AL';
UPDATE public.uf SET nome = 'Sergipe', geom = null, idpais = 45, cod_ibge = 28 WHERE sigla_uf = 'SE';
UPDATE public.uf SET nome = 'Bahia', geom = null, idpais = 45, cod_ibge = 29 WHERE sigla_uf = 'BA';
UPDATE public.uf SET nome = 'Minas Gerais', geom = null, idpais = 45, cod_ibge = 31 WHERE sigla_uf = 'MG';
UPDATE public.uf SET nome = 'Espírito Santo', geom = null, idpais = 45, cod_ibge = 32 WHERE sigla_uf = 'ES';
UPDATE public.uf SET nome = 'Rio de Janeiro', geom = null, idpais = 45, cod_ibge = 33 WHERE sigla_uf = 'RJ';
UPDATE public.uf SET nome = 'São Paulo', geom = null, idpais = 45, cod_ibge = 35 WHERE sigla_uf = 'SP';
UPDATE public.uf SET nome = 'Paraná', geom = null, idpais = 45, cod_ibge = 41 WHERE sigla_uf = 'PR';
UPDATE public.uf SET nome = 'Santa Catarina', geom = null, idpais = 45, cod_ibge = 42 WHERE sigla_uf = 'SC';
UPDATE public.uf SET nome = 'Rio Grande do Sul', geom = null, idpais = 45, cod_ibge = 43 WHERE sigla_uf = 'RS';
UPDATE public.uf SET nome = 'Mato Grosso do Sul', geom = null, idpais = 45, cod_ibge = 50 WHERE sigla_uf = 'MS';
UPDATE public.uf SET nome = 'Mato Grosso', geom = null, idpais = 45, cod_ibge = 51 WHERE sigla_uf = 'MT';
UPDATE public.uf SET nome = 'Goiás', geom = null, idpais = 45, cod_ibge = 52 WHERE sigla_uf = 'GO';
UPDATE public.uf SET nome = 'Distrito Federal', geom = null, idpais = 45, cod_ibge = 53 WHERE sigla_uf = 'DF';
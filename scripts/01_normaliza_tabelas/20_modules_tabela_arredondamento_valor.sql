alter table modules.tabela_arredondamento_valor
	add casa_decimal_exata smallint;

alter table modules.tabela_arredondamento_valor
	add acao smallint;

-- Remove not null
alter table modules.tabela_arredondamento_valor alter column valor_minimo drop not null;
alter table modules.tabela_arredondamento_valor alter column valor_maximo drop not null;

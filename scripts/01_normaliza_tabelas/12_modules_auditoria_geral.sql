create table modules.auditoria_geral
(
	usuario_id integer,
	operacao smallint,
	rotina varchar(50),
	valor_antigo json,
	valor_novo json,
	data_hora timestamp,
	codigo varchar
);

alter table modules.auditoria_geral owner to ieducar;

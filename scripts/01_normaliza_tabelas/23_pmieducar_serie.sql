alter table pmieducar.serie
	add regra_avaliacao_diferenciada_id integer;

alter table pmieducar.serie
	add alerta_faixa_etaria boolean;

alter table pmieducar.serie
	add bloquear_matricula_faixa_etaria boolean;

alter table pmieducar.serie
	add idade_ideal integer;

alter table pmieducar.serie
	add exigir_inep boolean;

alter table pmieducar.serie
	add constraint serie_regra_avaliacao_diferenciada_fk
		foreign key (regra_avaliacao_diferenciada_id) references modules.regra_avaliacao (id)
			on delete restrict;

create index idx_serie_cod_regra_avaliacao_id
	on pmieducar.serie (cod_serie, regra_avaliacao_id);

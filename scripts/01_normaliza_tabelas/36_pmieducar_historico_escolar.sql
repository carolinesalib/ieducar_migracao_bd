alter table pmieducar.historico_escolar add ref_cod_escola integer;
alter table pmieducar.historico_escolar add dependencia boolean;
alter table pmieducar.historico_escolar add posicao integer;

alter table pmieducar.historico_escolar
  add constraint historico_escolar_ref_cod_escola_fkey
foreign key (ref_cod_escola) references escola;


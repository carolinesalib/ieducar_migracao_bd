ALTER TABLE modules.ponto_transporte_escolar ADD COLUMN cep numeric(8);
ALTER TABLE modules.ponto_transporte_escolar ADD COLUMN idlog numeric(6);
ALTER TABLE modules.ponto_transporte_escolar ADD COLUMN idbai numeric(6);
ALTER TABLE modules.ponto_transporte_escolar ADD COLUMN numero numeric(6);
ALTER TABLE modules.ponto_transporte_escolar ADD COLUMN complemento varchar(20);
ALTER TABLE modules.ponto_transporte_escolar ADD COLUMN latitude varchar(20);
ALTER TABLE modules.ponto_transporte_escolar ADD COLUMN longitude varchar(20);

alter table modules.ponto_transporte_escolar
  add constraint fk_ponto_cep_log_bai
foreign key (idbai, idlog, cep) references urbano.cep_logradouro_bairro;

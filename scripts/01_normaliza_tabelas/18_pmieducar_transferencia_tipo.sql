alter table pmieducar.transferencia_tipo
  add ref_cod_instituicao integer;

alter table pmieducar.transferencia_tipo
  add constraint transferencia_tipo_ref_cod_instituicao
foreign key (ref_cod_instituicao) references pmieducar.instituicao
on update restrict on delete restrict;
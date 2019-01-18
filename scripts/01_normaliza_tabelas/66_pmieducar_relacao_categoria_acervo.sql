create table if not exists pmieducar.relacao_categoria_acervo
(
  ref_cod_acervo integer not null
    constraint relacao_categoria_acervo_ref_cod_acervo_fkey
    references pmieducar.acervo,
  categoria_id   integer not null
    constraint relacao_categoria_acervo_categoria_id_fkey
    references pmieducar.categoria_obra
);

alter table pmieducar.relacao_categoria_acervo
  owner to ieducar;

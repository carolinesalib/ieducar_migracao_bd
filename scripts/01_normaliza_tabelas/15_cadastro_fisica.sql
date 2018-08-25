-- Atualiza view pessoa fisica
create or replace view cadastro.v_pessoa_fisica as
  SELECT p.idpes,
         p.nome,
         p.url,
         p.email,
         p.situacao,
         f.data_nasc,
         f.sexo,
         f.cpf,
         f.ref_cod_sistema,
         f.idesco,
         f.ativo
  FROM pessoa p,
       fisica f
  WHERE (p.idpes = f.idpes);


alter table cadastro.fisica
  drop constraint fisica_ref_cod_religiao;
  
alter table cadastro.fisica
  add constraint fisica_ref_cod_religiao
foreign key (ref_cod_religiao) references pmieducar.religiao;


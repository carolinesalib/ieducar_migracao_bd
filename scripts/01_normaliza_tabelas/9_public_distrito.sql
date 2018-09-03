create table distrito
(
  idmun           numeric(6)                                                              not null
    constraint fk_distrito_municipio
    references municipio,
  geom            varchar,
  iddis           numeric(6) default nextval(('public.seq_distrito' :: text) :: regclass) not null
    constraint pk_distrito
    primary key,
  nome            varchar(80)                                                             not null,
  cod_ibge        varchar(7),
  idpes_rev       numeric
    constraint fk_distrito_sistema_idpes_rev
    references cadastro.pessoa
    on delete set null,
  data_rev        timestamp,
  origem_gravacao char                                                                    not null
    constraint ck_distrito_origem_gravacao
    check ((origem_gravacao = 'M' :: bpchar) OR (origem_gravacao = 'U' :: bpchar) OR (origem_gravacao = 'C' :: bpchar)
           OR (origem_gravacao = 'O' :: bpchar)),
  idpes_cad       numeric
    constraint fk_distrito_sistema_idpes_cad
    references cadastro.pessoa
    on delete set null,
  data_cad        timestamp                                                               not null,
  operacao        char                                                                    not null
    constraint ck_distrito_operacao
    check ((operacao = 'I' :: bpchar) OR (operacao = 'A' :: bpchar) OR (operacao = 'E' :: bpchar)),
  idsis_rev       integer
    constraint fk_distrito_sistema_idsis_rev
    references acesso.sistema
    on delete set null,
  idsis_cad       integer                                                                 not null
    constraint fk_distrito_sistema_idsis_cad
    references acesso.sistema
    on delete set null
);

-- Popula dados
INSERT INTO public.distrito (idmun,
                             geom,
                             iddis,
                             nome,
                             cod_ibge,
                             idpes_rev,
                             data_rev,
                             origem_gravacao,
                             idpes_cad,
                             data_cad,
                             operacao,
                             idsis_rev,
                             idsis_cad)
SELECT idmun,
       null,
       idmun,
       nome,
       '05',
       null,
       null,
       'M',
       1,
       data_cad,
       'I',
       null,
       9
FROM public.municipio;

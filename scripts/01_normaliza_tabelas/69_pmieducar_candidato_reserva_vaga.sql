create sequence pmieducar.candidato_reserva_vaga_seq;

alter sequence pmieducar.candidato_reserva_vaga_seq
  owner to ieducar;

create table pmieducar.candidato_reserva_vaga
(
  cod_candidato_reserva_vaga integer default nextval('pmieducar.candidato_reserva_vaga_seq' :: regclass) not null
    constraint cod_candidato_reserva_vaga_pkey
    primary key,
  ano_letivo                 integer                                                                     not null,
  data_solicitacao           date                                                                        not null,
  ref_cod_aluno              integer                                                                     not null
    constraint ref_cod_aluno_fkey
    references pmieducar.aluno,
  ref_cod_serie              integer                                                                     not null
    constraint ref_cod_serie_fkey
    references pmieducar.serie,
  ref_cod_turno              integer
    constraint ref_cod_turno_fkey
    references pmieducar.turma_turno,
  ref_cod_pessoa_cad         integer                                                                     not null
    constraint ref_cod_pessoa_cad_fkey
    references cadastro.pessoa,
  data_cad                   timestamp default now()                                                     not null,
  data_update                timestamp default now()                                                     not null,
  ref_cod_matricula          integer,
  situacao                   char,
  data_situacao              date,
  motivo                     varchar(255),
  ref_cod_escola             integer
    constraint candidato_reserva_vaga_ref_cod_escola
    references pmieducar.escola,
  quantidade_membros         smallint,
  mae_fez_pre_natal          boolean default false,
  membros_trabalham          smallint,
  hora_solicitacao           time
);

alter table pmieducar.candidato_reserva_vaga
  owner to ieducar;

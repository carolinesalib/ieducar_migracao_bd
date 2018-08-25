create table pmieducar.configuracoes_gerais
(
  ref_cod_instituicao                          integer           not null,
  permite_relacionamento_posvendas             integer default 1 not null,
  url_novo_educacao                            varchar(100),
  mostrar_codigo_inep_aluno                    smallint     default 1,
  justificativa_falta_documentacao_obrigatorio smallint     default 1,
  tamanho_min_rede_estadual                    integer,
  modelo_boletim_professor                     integer      default 1,
  custom_labels                                json,
  url_cadastro_usuario                         varchar(255) default NULL :: character varying,
  active_on_ieducar                            smallint     default 1,
  ieducar_image                                varchar(255) default NULL :: character varying,
  ieducar_entity_name                          varchar(255) default NULL :: character varying,
  ieducar_login_footer                         text         default '<p>Portabilis Tecnologia - suporte@portabilis.com.br - <a class="   light" href="http://suporte.portabilis.com.br" target="_blank"> Obter Suporte </a></p> ' :: character varying,
  ieducar_external_footer                      text         default '<p>Conhe&ccedil;a mais sobre o i-Educar e a Portabilis, acesse nosso <a href="   http://blog.portabilis.com.br">blog</a></p> ' :: character varying,
  ieducar_internal_footer                      text         default '<p>Conhe&ccedil;a mais sobre o i-Educar e a Portabilis, <a href="   http://blog.portabilis.com.br" target="_blank">acesse nosso blog</a> &nbsp;&nbsp;&nbsp; &copy; Portabilis - Todos os direitos reservados</p>' :: character varying,
  facebook_url                                 varchar(255) default 'https://www.facebook.com/portabilis' :: character varying,
  twitter_url                                  varchar(255) default 'https://twitter.com/portabilis' :: character varying,
  linkedin_url                                 varchar(255) default 'https://www.linkedin.com/company/portabilis-tecnologia' :: character varying,
  ieducar_suspension_message                   text
);

comment on column pmieducar.configuracoes_gerais.mostrar_codigo_inep_aluno
is 'Mostrar código INEP do aluno nas telas de cadastro';

comment on column pmieducar.configuracoes_gerais.justificativa_falta_documentacao_obrigatorio
is 'Campo "Justificativa para a falta de documentação" obrigatório no cadastro de alunos';

comment on column pmieducar.configuracoes_gerais.tamanho_min_rede_estadual
is 'Tamanho mínimo do campo "Código rede estadual"';

comment on column pmieducar.configuracoes_gerais.modelo_boletim_professor
is 'Modelo do boletim do professor. 1 - Padrão, 2 - Modelo recuperação por etapa, 3 - Modelo recuperação paralela';

comment on column pmieducar.configuracoes_gerais.custom_labels
is 'Guarda customizações em labels e textos do sistema.';

comment on column pmieducar.configuracoes_gerais.url_cadastro_usuario
is 'URL da ferramenta externa de cadastro de usuários';

alter table pmieducar.configuracoes_gerais
  owner to postgres;


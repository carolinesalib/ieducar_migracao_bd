ALTER TABLE cadastro.documento ADD COLUMN cartorio_cert_civil_inep integer;
ALTER TABLE cadastro.documento ADD COLUMN certidao_casamento varchar(50);
ALTER TABLE cadastro.documento ADD COLUMN passaporte varchar(20);
ALTER TABLE cadastro.documento ADD COLUMN comprovante_residencia varchar(255);
ALTER TABLE cadastro.documento ADD COLUMN declaracao_trabalho_autonomo varchar;

CREATE TABLE cadastro.codigo_cartorio_inep (
                id SERIAL NOT NULL,
                id_cartorio INTEGER NOT NULL,
                descricao VARCHAR,
                cod_serventia INTEGER,
                cod_municipio INTEGER,
                ref_sigla_uf VARCHAR(3),
                CONSTRAINT pk_id PRIMARY KEY(id),
                CONSTRAINT fk_ref_sigla_uf FOREIGN KEY(ref_sigla_uf) REFERENCES public.uf(sigla_uf)
            );

ALTER TABLE cadastro.documento
            ADD CONSTRAINT cartorio_cert_civil_inep_fk
            FOREIGN KEY(cartorio_cert_civil_inep)
            REFERENCES cadastro.codigo_cartorio_inep(id)
            ON DELETE RESTRICT 
            ON UPDATE RESTRICT;
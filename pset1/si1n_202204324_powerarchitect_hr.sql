
CREATE SEQUENCE public.cargos_id_cargo_seq_1;

CREATE SEQUENCE public.cargos_cargo_seq;

CREATE SEQUENCE public.cargos_salario_minimo_seq;

CREATE SEQUENCE public.cargos_salario_maximo_seq;

CREATE TABLE public.cargos (
                id_cargo VARCHAR(10) NOT NULL DEFAULT nextval('public.cargos_id_cargo_seq_1'),
                cargo VARCHAR(35) NOT NULL DEFAULT nextval('public.cargos_cargo_seq'),
                salario_minimo NUMERIC(8,2) DEFAULT nextval('public.cargos_salario_minimo_seq'),
                salario_maximo NUMERIC(8,2) DEFAULT nextval('public.cargos_salario_maximo_seq'),
                CONSTRAINT cargos_pk PRIMARY KEY (id_cargo)
);
COMMENT ON TABLE public.cargos IS 'Tabela referente a documentação das informações relacionadas aos cargos existentes em determinada empresa.';
COMMENT ON COLUMN public.cargos.id_cargo IS 'Chave Primaria para identificação dos cargos existentes.';
COMMENT ON COLUMN public.cargos.cargo IS 'Alternate key para inscrição do nome do cargo relacionado.';
COMMENT ON COLUMN public.cargos.salario_minimo IS 'Coluna para inscrição do valor do salario minimo de dado cargo.';
COMMENT ON COLUMN public.cargos.salario_maximo IS 'Coluna para inscrição do salario maximo que pode ser recebido por um empregado de determinado cargo.';


ALTER SEQUENCE public.cargos_id_cargo_seq_1 OWNED BY public.cargos.id_cargo;

ALTER SEQUENCE public.cargos_cargo_seq OWNED BY public.cargos.cargo;

ALTER SEQUENCE public.cargos_salario_minimo_seq OWNED BY public.cargos.salario_minimo;

ALTER SEQUENCE public.cargos_salario_maximo_seq OWNED BY public.cargos.salario_maximo;

CREATE UNIQUE INDEX cargos_idx
 ON public.cargos
 ( cargo );

CREATE SEQUENCE public.regioes_id_regiao_seq;

CREATE SEQUENCE public.regioes_nome_seq;

CREATE TABLE public.regioes (
                id_regiao INTEGER NOT NULL DEFAULT nextval('public.regioes_id_regiao_seq'),
                nome VARCHAR(25) NOT NULL DEFAULT nextval('public.regioes_nome_seq'),
                CONSTRAINT regioes_pk PRIMARY KEY (id_regiao)
);
COMMENT ON TABLE public.regioes IS 'Tabela referente a identificação das regiões  a partir de uma chave primaria e nome, em que dada empresa existe.';
COMMENT ON COLUMN public.regioes.id_regiao IS 'Chave Primaria para identificação das regiões.';
COMMENT ON COLUMN public.regioes.nome IS 'Alternate Key com o nome das regiões presentes na tabela.';


ALTER SEQUENCE public.regioes_id_regiao_seq OWNED BY public.regioes.id_regiao;

ALTER SEQUENCE public.regioes_nome_seq OWNED BY public.regioes.nome;

CREATE UNIQUE INDEX regioes_idx
 ON public.regioes
 ( nome );

CREATE SEQUENCE public.paises_id_pais_seq;

CREATE SEQUENCE public.paises_nome_seq;

CREATE TABLE public.paises (
                id_pais CHAR(2) NOT NULL DEFAULT nextval('public.paises_id_pais_seq'),
                nome VARCHAR(50) NOT NULL DEFAULT nextval('public.paises_nome_seq'),
                id_regiao INTEGER,
                CONSTRAINT paises_pk PRIMARY KEY (id_pais)
);
COMMENT ON TABLE public.paises IS 'Tabela referente aos paises de dadas regiões em que existe uma determinada empresa.';
COMMENT ON COLUMN public.paises.id_pais IS 'Chave Primaria para identificação dos países de determinada região.';
COMMENT ON COLUMN public.paises.nome IS 'Alternate key para inscrição do nome do país de uma dada região.';
COMMENT ON COLUMN public.paises.id_regiao IS 'Chave Estrangeira com a identificação da região onde o país se citua.';


ALTER SEQUENCE public.paises_id_pais_seq OWNED BY public.paises.id_pais;

ALTER SEQUENCE public.paises_nome_seq OWNED BY public.paises.nome;

CREATE UNIQUE INDEX paises_idx
 ON public.paises
 ( nome );

CREATE SEQUENCE public.localizacoes_id_localizacao_seq;

CREATE SEQUENCE public.localizacoes_endereco_seq;

CREATE SEQUENCE public.localizacoes_cep_seq;

CREATE SEQUENCE public.localizacoes_cidade_seq;

CREATE SEQUENCE public.localizacoes_uf_seq;

CREATE TABLE public.localizacoes (
                id_localizacao INTEGER NOT NULL DEFAULT nextval('public.localizacoes_id_localizacao_seq'),
                endereco VARCHAR(50) DEFAULT nextval('public.localizacoes_endereco_seq'),
                cep VARCHAR(12) DEFAULT nextval('public.localizacoes_cep_seq'),
                cidade VARCHAR(50) DEFAULT nextval('public.localizacoes_cidade_seq'),
                uf VARCHAR(25) DEFAULT nextval('public.localizacoes_uf_seq'),
                id_pais CHAR(2),
                CONSTRAINT localizacoes_pk PRIMARY KEY (id_localizacao)
);
COMMENT ON TABLE public.localizacoes IS 'Tabela referente as localizações exatas de determinada empresa dentro de um país.';
COMMENT ON COLUMN public.localizacoes.id_localizacao IS 'Chave primária para identificação da localização.';
COMMENT ON COLUMN public.localizacoes.endereco IS 'Coluna para inscrição do endereço.';
COMMENT ON COLUMN public.localizacoes.cep IS 'Coluna para inscrição do cep.';
COMMENT ON COLUMN public.localizacoes.cidade IS 'Coluna para inscrição da cidade';
COMMENT ON COLUMN public.localizacoes.uf IS 'Coluna para inscrição do estado.';
COMMENT ON COLUMN public.localizacoes.id_pais IS 'Chave estrangeira para identificação dos países de determinada região.';


ALTER SEQUENCE public.localizacoes_id_localizacao_seq OWNED BY public.localizacoes.id_localizacao;

ALTER SEQUENCE public.localizacoes_endereco_seq OWNED BY public.localizacoes.endereco;

ALTER SEQUENCE public.localizacoes_cep_seq OWNED BY public.localizacoes.cep;

ALTER SEQUENCE public.localizacoes_cidade_seq OWNED BY public.localizacoes.cidade;

ALTER SEQUENCE public.localizacoes_uf_seq OWNED BY public.localizacoes.uf;

CREATE SEQUENCE public.departamentos_id_departamento_seq;

CREATE SEQUENCE public.departamentos_nome_seq;

CREATE TABLE public.departamentos (
                id_departamento INTEGER NOT NULL DEFAULT nextval('public.departamentos_id_departamento_seq'),
                nome VARCHAR(50) DEFAULT nextval('public.departamentos_nome_seq'),
                id_localizacao INTEGER,
                id_gerente INTEGER,
                CONSTRAINT departamentos_pk PRIMARY KEY (id_departamento)
);
COMMENT ON TABLE public.departamentos IS 'Tabela referente ao detalhamento de infromações sobre os departamento de determinada empresa.';
COMMENT ON COLUMN public.departamentos.id_departamento IS 'Chave Primária para identificação de um departamento.';
COMMENT ON COLUMN public.departamentos.nome IS 'Alternate key para inscrição do nome dos departamentos.';
COMMENT ON COLUMN public.departamentos.id_localizacao IS 'Chave estrangeira para identificação da localização dos departamentos.';
COMMENT ON COLUMN public.departamentos.id_gerente IS 'Chave estrangeira para identificação do gerente de determinado departamento.';


ALTER SEQUENCE public.departamentos_id_departamento_seq OWNED BY public.departamentos.id_departamento;

ALTER SEQUENCE public.departamentos_nome_seq OWNED BY public.departamentos.nome;

CREATE UNIQUE INDEX departamentos_idx
 ON public.departamentos
 ( nome );

CREATE SEQUENCE public.empregados_id_empregado_seq_1;

CREATE SEQUENCE public.empregados_nome_seq;

CREATE SEQUENCE public.empregados_email_seq;

CREATE SEQUENCE public.empregados_telefone_seq;

CREATE SEQUENCE public.empregados_data_contratacao_seq;

CREATE SEQUENCE public.empregados_salario_seq;

CREATE SEQUENCE public.empregados_comissao_seq;

CREATE SEQUENCE public.departamentos_id_departamento_seq_1;

CREATE SEQUENCE public.empregados_id_empregado_seq_2;

CREATE TABLE public.empregados (
                id_empregado INTEGER NOT NULL DEFAULT nextval('public.empregados_id_empregado_seq_1'),
                nome VARCHAR(75) NOT NULL DEFAULT nextval('public.empregados_nome_seq'),
                email VARCHAR(35) NOT NULL DEFAULT nextval('public.empregados_email_seq'),
                telefone VARCHAR(20) DEFAULT nextval('public.empregados_telefone_seq'),
                data_contratacao DATE NOT NULL DEFAULT nextval('public.empregados_data_contratacao_seq'),
                id_cargo VARCHAR(10) NOT NULL,
                salario NUMERIC(8,2) DEFAULT nextval('public.empregados_salario_seq'),
                comissao NUMERIC(4,2) DEFAULT nextval('public.empregados_comissao_seq'),
                id_departamento INTEGER DEFAULT nextval('public.departamentos_id_departamento_seq_1'),
                id_supervisor INTEGER DEFAULT nextval('public.empregados_id_empregado_seq_2'),
                CONSTRAINT empregados_pk PRIMARY KEY (id_empregado)
);
COMMENT ON TABLE public.empregados IS 'Tabela referente a documentaçã detalhada das informações dos empregados de determinada empresa.';
COMMENT ON COLUMN public.empregados.id_empregado IS 'Chave primaria para identificação dos empregados';
COMMENT ON COLUMN public.empregados.nome IS 'Coluna para inscrição do nome dos empregados de uma empresa.';
COMMENT ON COLUMN public.empregados.email IS 'Alternate key referente a inscrição do email dos empregados de determinada empresa.';
COMMENT ON COLUMN public.empregados.telefone IS 'Coluna para inscrição do telefone dos empregados da empresa.';
COMMENT ON COLUMN public.empregados.data_contratacao IS 'Coluna para a inscrição da data de contratação dos empregados.';
COMMENT ON COLUMN public.empregados.id_cargo IS 'Chave estrangeira para identificação do cargo ocupado pelo empregado.';
COMMENT ON COLUMN public.empregados.salario IS 'Coluna para inscrição do salario recebido por determinado empregado.';
COMMENT ON COLUMN public.empregados.comissao IS 'Coluna para inscrição da comissão recebida pelos empregados.';
COMMENT ON COLUMN public.empregados.id_departamento IS 'Chave estrangeira para identificação do departamento em que dado empregado trabalha.';
COMMENT ON COLUMN public.empregados.id_supervisor IS 'Chave estrangeira para identificação do surpervisor dos empregados.';


ALTER SEQUENCE public.empregados_id_empregado_seq_1 OWNED BY public.empregados.id_empregado;

ALTER SEQUENCE public.empregados_nome_seq OWNED BY public.empregados.nome;

ALTER SEQUENCE public.empregados_email_seq OWNED BY public.empregados.email;

ALTER SEQUENCE public.empregados_telefone_seq OWNED BY public.empregados.telefone;

ALTER SEQUENCE public.empregados_data_contratacao_seq OWNED BY public.empregados.data_contratacao;

ALTER SEQUENCE public.empregados_salario_seq OWNED BY public.empregados.salario;

ALTER SEQUENCE public.empregados_comissao_seq OWNED BY public.empregados.comissao;

ALTER SEQUENCE public.departamentos_id_departamento_seq_1 OWNED BY public.empregados.id_departamento;

ALTER SEQUENCE public.empregados_id_empregado_seq_2 OWNED BY public.empregados.id_supervisor;

CREATE UNIQUE INDEX empregados_idx
 ON public.empregados
 ( email );

CREATE SEQUENCE public.historico_cargos_data_inicial_seq;

CREATE SEQUENCE public.historico_cargos_data_final_seq;

CREATE SEQUENCE public.departamentos_id_departamento_seq_2;

CREATE TABLE public.historico_cargos (
                id_empregado INTEGER NOT NULL,
                data_inicial DATE NOT NULL DEFAULT nextval('public.historico_cargos_data_inicial_seq'),
                data_final DATE NOT NULL DEFAULT nextval('public.historico_cargos_data_final_seq'),
                id_cargo VARCHAR(10) NOT NULL,
                id_departamento INTEGER DEFAULT nextval('public.departamentos_id_departamento_seq_2'),
                CONSTRAINT historico_cargos_pk PRIMARY KEY (id_empregado, data_inicial)
);
COMMENT ON TABLE public.historico_cargos IS 'Tabela para documentação do historico dos cargos de determinada empresa.';
COMMENT ON COLUMN public.historico_cargos.id_empregado IS 'Chave primaria estrangeira para identificação dos empregados.';
COMMENT ON COLUMN public.historico_cargos.data_inicial IS 'Chave primaria para inscrição da data em que determinado empregado começou a trabalhar em um cargo.';
COMMENT ON COLUMN public.historico_cargos.data_final IS 'Coluna para inscrição da data em que determinado empregado encerrou seus trabalhos em um determinado cargo na empresa.';
COMMENT ON COLUMN public.historico_cargos.id_cargo IS 'Chave estrangeira para identificação do cargo ocupado por um empregado por determinado periodo.';
COMMENT ON COLUMN public.historico_cargos.id_departamento IS 'Chave estrangeria para identificação do departamento em que dado empregado trabalhou.';


ALTER SEQUENCE public.historico_cargos_data_inicial_seq OWNED BY public.historico_cargos.data_inicial;

ALTER SEQUENCE public.historico_cargos_data_final_seq OWNED BY public.historico_cargos.data_final;

ALTER SEQUENCE public.departamentos_id_departamento_seq_2 OWNED BY public.historico_cargos.id_departamento;

ALTER TABLE public.empregados ADD CONSTRAINT cargos_empregados_fk
FOREIGN KEY (id_cargo)
REFERENCES public.cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.historico_cargos ADD CONSTRAINT cargos_historico_cargos_fk
FOREIGN KEY (id_cargo)
REFERENCES public.cargos (id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.paises ADD CONSTRAINT regioes_paises_fk
FOREIGN KEY (id_regiao)
REFERENCES public.regioes (id_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.localizacoes ADD CONSTRAINT paises_localizacoes_fk
FOREIGN KEY (id_pais)
REFERENCES public.paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.departamentos ADD CONSTRAINT localizacoes_departamentos_fk
FOREIGN KEY (id_localizacao)
REFERENCES public.localizacoes (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empregados ADD CONSTRAINT departamentos_empregados_fk
FOREIGN KEY (id_departamento)
REFERENCES public.departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.historico_cargos ADD CONSTRAINT departamentos_historico_cargos_fk
FOREIGN KEY (id_departamento)
REFERENCES public.departamentos (id_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.departamentos ADD CONSTRAINT empregados_departamentos_fk
FOREIGN KEY (id_gerente)
REFERENCES public.empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empregados ADD CONSTRAINT empregados_empregados_fk
FOREIGN KEY (id_supervisor)
REFERENCES public.empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.historico_cargos ADD CONSTRAINT empregados_historico_cargos_fk
FOREIGN KEY (id_empregado)
REFERENCES public.empregados (id_empregado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
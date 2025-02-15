
CREATE TABLE PAIS (
    ID_PAIS NUMBER PRIMARY KEY,
    NOME_PAIS VARCHAR2(30)
);


CREATE TABLE ESTADO (
    id_estado NUMBER PRIMARY KEY,
    nome_estado VARCHAR2(30), 
    id_pais NUMBER
);


ALTER TABLE ESTADO 
    ADD CONSTRAINT fk_estado_pais FOREIGN KEY (id_pais) REFERENCES PAIS (ID_PAIS);


CREATE TABLE CIDADE (
    ID_CIDADE NUMBER PRIMARY KEY,
    nome_cidade VARCHAR2(30),
    id_estado NUMBER
);


ALTER TABLE CIDADE 
    ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES ESTADO (id_estado);


CREATE TABLE BAIRRO (
    id_bairro NUMBER PRIMARY KEY,
    nome_bairro VARCHAR2(30),
    id_cidade NUMBER
);


ALTER TABLE BAIRRO 
    ADD CONSTRAINT fk_bairro_cidade FOREIGN KEY (id_cidade) REFERENCES CIDADE (id_cidade);


CREATE TABLE TIPO_LOGRADOURO (
    id_tipo_log NUMBER PRIMARY KEY,
    descricao VARCHAR2(30)
);


CREATE TABLE END_CLIENTE (
    id_end NUMBER PRIMARY KEY,
    logadouro VARCHAR2(50),
    numero NUMBER,
    cep NUMBER,
    id_tipo_log NUMBER,
    referencia VARCHAR2(30),
    complemento VARCHAR2(30)
);


ALTER TABLE END_CLIENTE 
    ADD CONSTRAINT fk_end_cliente_tipo_log FOREIGN KEY (id_tipo_log) REFERENCES TIPO_LOGRADOURO (id_tipo_log);


CREATE TABLE CLIENTE (
    id_cliente NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    data_nasc DATE,
    cpf_cnpj NUMBER,
    id_tipo_cli NUMBER,
    id_genero NUMBER,
    email VARCHAR2(30),
    telefone NUMBER
);


CREATE TABLE TIPO_CLIENTE (
    id_tipo_cli NUMBER PRIMARY KEY,
    descricao VARCHAR2(30)
);


CREATE TABLE GENERO (
    ID_GENERO NUMBER PRIMARY KEY,
    descricao VARCHAR2(30)
);


ALTER TABLE CLIENTE 
    ADD CONSTRAINT fk_cliente_genero FOREIGN KEY (id_genero) REFERENCES GENERO (ID_GENERO);

ALTER TABLE CLIENTE 
    ADD CONSTRAINT fk_cliente_tipo_cli FOREIGN KEY (id_tipo_cli) REFERENCES TIPO_CLIENTE (id_tipo_cli);


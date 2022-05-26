use teste3;

create table relatorio_cadop(
	registro_ans bigint primary key,
    cnpj varchar(255),
    razao_social varchar(500),
    nome_fantasia varchar(255),
    modalidade varchar(255),
    logradouro varchar(255),
    numero varchar(255),
    complemento varchar(255),
    bairro varchar(255),
    cidade varchar(255),
    uf char(3),
    cep bigint,
    ddd int,
    telefone bigint,
    fax bigint,
    endereco_eletronico varchar(255),
    representante varchar(255),
    cargo varchar(255),
    data_registro_ans  varchar(10)
);

load data local infile 'Documents\ProcessoSeletivo_IntuitiveCare\Teste3' 
into table relatorio_cadop2
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
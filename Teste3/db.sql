create database teste3;

use teste3;

create table relatorio_cadop(
	data_registro_ans  varchar(10),
	reg_ans bigint,
	cd_conta_contabil bigint,
   	descricao varchar(255),
	vl_saldo_final varchar(255)
);

load data local infile 'C:/Users/Gabriela/Documents/ProcessoSeletivo_IntuitiveCare/Teste3/Dados2021/4T2021/4T2021.csv'
into table relatorio_cadop
character set latin1
fields terminated by ';' 
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;
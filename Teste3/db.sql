create database teste3;

use teste3;

create table relatorio_cadop(
	data_registro_ans  varchar(10),
	reg_ans bigint,
	cd_conta_contabil bigint,
   	descricao varchar(255),
    	vl_saldo_inicial varchar(255),
	vl_saldo_final varchar(255)
);

-- Os csv de 2020, 1T2021, 2T2021 e 3T2021 usam esse query

load data local infile 'C:/Users/Gabriela/Documents/ProcessoSeletivo_IntuitiveCare/Teste3/Dados2021/3T2021/3T2021.csv'
into table relatorio_cadop 
character set latin1
fields terminated by ';' 
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines
(@"DATA", @REG_ANS, @CD_CONTA_CONTABIL, @DESCRICAO, @VL_SALDO_FINAL) 
set data_registro_ans = @"DATA", reg_ans = @REG_ANS, cd_conta_contabil = @CD_CONTA_CONTABIL, descricao = @DESCRICAO, vl_saldo_final = @VL_SALDO_FINAL 
;

-- O 4T2021 usa esse

load data local infile 'C:/Users/Gabriela/Documents/ProcessoSeletivo_IntuitiveCare/Teste3/Dados2021/4T2021/4T2021.csv'
into table relatorio_cadop 
character set utf8mb4
fields terminated by ';' 
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;


select data_registro_ans, reg_ans, descricao, sum(vl_saldo_inicial), sum(vl_saldo_final)
from relatorio_cadop
where data_registro_ans = "2021-10-01" and descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
group by reg_ans
order by vl_saldo_final desc
limit 10;

select data_registro_ans, reg_ans, descricao, sum(vl_saldo_inicial), sum(vl_saldo_final)
from relatorio_cadop
where data_registro_ans like "%2021%" and descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
group by data_registro_ans, reg_ans 
order by vl_saldo_final desc
limit 10;
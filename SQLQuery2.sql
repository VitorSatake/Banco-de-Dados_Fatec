/*drop apaga toda a estrutura da tabela*/
drop table tb_socios 

/*create criar a estrutura da tabela*/
create table tb_socios (cd_socio int primary key, nm_socio char(40))

drop table dependentes

create table dependentes (cd_socio int, cd_dependente int, nm_dependente char(40), foreign key (cd_socio) references tb_socios(cd_socio), primary key(cd_socio, cd_dependente))

/*insert into faz a inclusão de dados na tabela*/
insert into tb_socios values (1,'socio numero 1')
insert into tb_socios values (2,'socio numero 2')
insert into tb_socios values (3,'socio numero 3')
insert into tb_socios values (4,'socio numero 4')

/*select count faz a contagem de dados da tabela*/
select count(*)from tb_socios

/*select from lista toda a tabela*/
select * from tb_socios

insert into dependentes values (1,1,'dependente 1 do socio 1')
insert into dependentes values (1,2,'dependente 1 do socio 2')
insert into dependentes values (2,1,'dependente 2 do socio 1')
insert into dependentes values (3,1,'dependente 3 do socio 1')

select count(*)from dependentes
select * from dependentes

/*delete remove um dados especifico*/
delete from dependentes where cd_socio = 3 and cd_dependente = 1

/*update atualiza o dados*/
update tb_socios set nm_socio = 'nome do socio 1 alterado' where cd_socio = 1

/*truncate apaga todos os dados da tabela sem perder a estrutura*/
truncate table tb_socios

/*Forma incorreta de listar*/
select nm_socio, nm_dependente from tb_socios, dependentes

/*Forma correta*/
select nm_socio, nm_dependente from tb_socios, dependentes where tb_socios.cd_socio = dependentes.cd_socio

select * from tb_socios
select max(cd_socio) from tb_socios /*Consulta o valor maximo*/
select min(cd_socio) from tb_socios /*Consulta o valor minimo*/
select avg(cd_socio) from tb_socios /*Consulta o valor médio*/
select sum(cd_socio) from tb_socios /*Consulta a soma*/

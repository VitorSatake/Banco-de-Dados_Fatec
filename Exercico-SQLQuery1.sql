create table tb_clientes(
	cd_cliente int primary key,
	nm_cliente varchar(20),
	cd_sexo char(1)
);

insert into tb_clientes values 
	(1,'Jose', 'M'),
	(2,'Maria', 'F'),
	(3,'Manuel','M'),
	(4,'Marcia','F')
;

create table tb_produtos(
	cd_produto int primary key,
	nm_produto varchar(20),
	vl_produto money
);

insert into tb_produtos values 
	(1,'produto1', '10.00'),
	(2,'produto2', '14.00'),
	(3,'produto3','16.00'),
	(4,'produto4','22.00')
;

create table tb_vendas(
	cd_venda int primary key,
	dt_venda date,
	cd_cliente int,
	cd_produto int,
	FOREIGN KEY (cd_cliente) references tb_clientes(cd_cliente),
	FOREIGN KEY (cd_produto) references tb_produtos(cd_produto),
	qt_venda int,
	vl_venda money
)

insert into tb_vendas values 
	(1,'10/2/2015',1,1,1,10.00),
	(2,'10/2/2015',4,1,10,100.00),
	(3,'11/3/2015',4,2,1,14.00),
	(4,'02/4/2015',2,1,100,1000.00),
	(5,'03/4/2015',2,1,2,20.00),
	(6,'12/5/2015',3,3,2,32.00),
	(7,'22/5/2015',2,1,9,900.00)
;

select * from tb_clientes
select * from tb_produtos
select * from tb_vendas

/*Quantos clientes estão cadastrados no sistema*/
select count(*) from tb_clientes

/*Quais os nomes dos cliente do sexo masculino*/
select nm_cliente from tb_clientes where cd_sexo = 'M'

/*Listar nome do cliente, nome do produto, data da venda, quantidade vendida e valor da venda cujo valor da venda seja maior que  50,00*/
select cd_venda, nm_cliente, nm_produto, dt_venda, qt_venda, tb_vendas.vl_venda 
from tb_clientes, tb_produtos, tb_vendas
where tb_vendas.cd_cliente = tb_clientes.cd_cliente and
      tb_vendas.cd_produto = tb_produtos.cd_produto  
      and tb_vendas.vl_venda > 50

/*Listar o nome do comprador cuja compra seja a de maior valor*/
select  cd_venda, nm_cliente , vl_venda
from tb_clientes, tb_vendas
where tb_vendas.cd_cliente = tb_clientes.cd_cliente and
       vl_venda = (select max(vl_venda) from tb_vendas)

/*Idem acima para as vendas cujo valores sejam maiores que a média de valor das vendas*/
select  cd_venda, nm_cliente , vl_venda
 from tb_clientes, tb_vendas
 where tb_vendas.cd_cliente = tb_clientes.cd_cliente and
       vl_venda > (select avg(vl_venda) from tb_vendas)

/*Alterar o nome do “produto3” para “produto3 alterado”*/
update tb_produtos set nm_produto = 'Produto 3 alterado' 
 where cd_produto = 3
 
 /*Excluir do cadastro o produto 004*/
 delete from tb_produtos where cd_produto = 4
 
 /*Qual o valor total das vendas por produto*/
 select cd_produto, sum(vl_venda) from tb_vendas
 group by cd_produto

 /*Quantas vendas foram realizadas para os clientes do sexo feminino?*/
 select nm_cliente,cd_sexo, nm_produto, qt_venda, tb_vendas.vl_venda from tb_clientes, tb_produtos, tb_vendas
 where tb_vendas.cd_cliente = tb_clientes.cd_cliente and
       tb_vendas.cd_produto = tb_produtos.cd_produto
       and tb_vendas.vl_venda = (select max(vl_venda) from tb_vendas)
       and cd_sexo = 'F'

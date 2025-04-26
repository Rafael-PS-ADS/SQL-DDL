create database loja;
use loja;

create table clientes
(
codigoCliente int primary key,
nome varchar(50),
logradouro varchar(50),
numero varchar(8),
bairro varchar (50),
cep char(8),
cidade varchar(20),
UF char(2),
CNPJ char(14),
IE varchar(20)
);

create table produtos
(
codigoProduto int primary key,
nome varchar(50),
precoUnitario decimal(10,4),
quantidadeEstoque int
);

create table vendedores
(
codigoVendedor int primary key,
nome varchar(50),
salarioFixo decimal(10,4)
);

create table pedidos
(
codigoPedido int primary key,
dataPedido timestamp,
dataEntrega datetime,
codigoVendedor int,
codigoCliente int,
constraint fk1 foreign key(codigoVendedor) references vendedores (codigoVendedor),
constraint fk2 foreign key(codigoCliente) references clientes(codigoCliente)
);

use loja;
create table itemPedidos
(
codigoProduto int,
codigoPedido int,
quantidade int,
constraint fk3 foreign key(codigoProduto) references produtos(codigoProduto),
constraint fk4 foreign key(codigoPedido) references pedidos(codigoPedido),
constraint pk10 primary key(codigoProduto, codigoPedido)
);

-- Para adicionar e modificar
alter table produtos add column statusProd bit;
alter table clientes add column dataNasc datetime;
alter table clientes modify nome varchar(100);
-- Apaga o relacionamento
alter table itemPedidos drop constraint fk3;
-- Altera os tipos de dados
alter table produtos modify codigoProduto bigint;
alter table itemPedidos modify codigoProduto bigint;
-- Religando a chave estrangeira novamente
alter table itemPedidos add constraint fk3
foreign key(codigoProduto) references produtos(codigoProduto);
-- Alterando o nome
alter table clientes change nome nomeCliente varchar(100);
alter table produtos change nome nomeProduto varchar(100);
-- Para apagar coluna
alter table produtos drop column statusProd;
-- Apenas teste, não vai ser executado
alter table clientes add constraint pk100 primary key(codigoCliente);
alter table ItemPedidos add constraint pk22 primary key(codigoProduto, codigoPedido);
-- Para apagar tabelas (não vai ser executado)
drop table itemPedidos;
drop table pedidos;
drop table clientes;
drop table produtos;
drop table vendedores;

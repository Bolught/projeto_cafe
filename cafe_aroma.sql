create database cafe_aroma;
use cafe_aroma;

create table endereco
(
	id_endereco int auto_increment primary key,
    rua varchar(150) not null,
    numero varchar(10) not null,
    cidade varchar(50) not null,
    estado varchar(4) not null null,
    complemento varchar(30),
    cep char(12) not null 
);

create table promocao
(
	id_promocao int auto_increment primary key,
    nome varchar(50) not null,
    descricao varchar(50) not null,
    data_inicio date not null,
    data_fim date not null,
    desconto_percentual decimal(5,2)
);

create table cafe
(
	id_cafe int auto_increment primary key,
    nome varchar(50) not null unique,
    pais varchar(20) not null,
    sabor varchar(20) not null,
    quantidade decimal(7,2) not null,
    unidade_medida char(2) not null
);

create table ingrediente
(
	id_ingrediente int auto_increment primary key,
    nome varchar(50) not null,
    preco_unidade decimal(7,2) not null,
    quantidade decimal(7,2) not null,
    unidade_medida char(2) not null
);

create table filial
(
	id_filial int auto_increment primary key,
    nome varchar(50) not null,
    cnpj char(14) not null unique,
    id_endereco int not null,
    foreign key(id_endereco) references endereco(id_endereco) -- chave estrangeira
);


create table cliente
(
	id_cliente int auto_increment primary key,
    nome varchar(50) not null,
    sobrenome varchar(100) not null,
    cpf char(12) not null unique,
    email varchar(50) not null unique,
	sexo char(1) COLLATE utf8mb4_bin check(sexo in("M","F")) not null,
    data_cadastro date not null,
	id_endereco int not null,
    foreign key(id_endereco) references endereco(id_endereco)     
);

create table departamento
(
	id_departamento int auto_increment primary key,
    nome varchar(50) not null,
    id_filial int not null,
    foreign key(id_filial) references filial(id_filial)
);

create table funcionario
(
	id_funcionario int auto_increment primary key,
    nome varchar(50) not null,
    sobrenome varchar(100),
    cpf char(12) not null unique,
    sexo char(1) COLLATE utf8mb4_bin check(sexo in("M","F")) not null,
    id_endereco int not null,
    foreign key(id_endereco) references endereco(id_endereco),
    id_departamento int not null,
    foreign key(id_departamento) references departamento(id_departamento) 
);

create table produto
(
	id_produto int auto_increment primary key,
    nome varchar(50) not null unique,
    preco_unitario decimal(5,2) not null,
    data_validade date not null,
    quantidade decimal(7,2) not null,
    unidade_medida char(2) not null,
    id_cafe int not null,
    foreign key(id_cafe) references cafe(id_cafe)
);



create table telefone_cliente
(
	id_cliente int not null,
    telefone char(14),
    foreign key(id_cliente) references cliente(id_cliente)
);

create table telefone_filial
(
	id_filial int not null,
    telefone char(14) not null,
    foreign key(id_filial) references filial(id_filial)
);

create table email_filial
(
	id_filial int not null,
    email char(50) not null,
    foreign key(id_filial) references filial(id_filial)
);

create table telefone_funcionario
(
	id_funcionario int not null,
    email char(50) not null,
    foreign key(id_funcionario) references funcionario(id_funcionario) 
);

create table email_funcionario
(
	id_funcionario int not null,
    email char(50) not null,
     foreign key(id_funcionario) references funcionario(id_funcionario) 
);

create table pedido
(
	id_pedido int auto_increment primary key,
    data_pedido date,
    forma_pagamento varchar(20),
    total decimal(7,2),
    id_filial int not null,
    id_funcionario int not null,
    id_cliente int not null,
    id_produto int not null,
    foreign key(id_filial) references filial(id_filial),
	foreign key(id_funcionario) references funcionario(id_funcionario),
    foreign key(id_cliente) references cliente(id_cliente),
    foreign key(id_produto) references produto(id_produto)    
);

create table item_pedido
(
	id_item_pedido int auto_increment primary key,
    preco_unitario decimal (7,2),
    quantida int,
	id_produto int not null,
	foreign key(id_produto) references produto(id_produto)    
);

create table pedido_usa_promocao
(
	id_pp int auto_increment primary key,
    id_promocao int,
    id_pedido int,
    foreign key(id_promocao) references promocao(id_promocao),
    foreign key(id_pedido) references pedido(id_pedido)
);

create table produtos_ingredientes
(
	id_produto int,
    id_ingrediente int,
    quantidade decimal(7,2),
    unidade_medida char(3),
    foreign key(id_produto) references produto(id_produto),
    foreign key(id_ingrediente) references ingrediente(id_ingrediente) 
);


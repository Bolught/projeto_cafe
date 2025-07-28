# Café Aroma - Banco de Dados

## 📖 Sobre o Projeto

Este repositório contém o esquema do banco de dados para o projeto Café Aroma, um sistema de gerenciamento para uma rede de cafeterias. O banco de dados foi projetado utilizando SQL como linguagem padrão e implementado no sistema de gerenciamento de banco de dados MySQL. A estrutura foi criada para armazenar e gerenciar informações sobre filiais, funcionários, clientes, produtos, ingredientes, promoções e pedidos, fornecendo uma base robusta para a operação do negócio.

---

## 📊 Diagrama do Banco de Dados

O diagrama Entidade-Relacionamento (ER) abaixo ilustra a estrutura do banco de dados, mostrando as tabelas e seus respectivos relacionamentos.

![Diagrama do Banco de Dados Café Aroma](https://github.com/Bolught/projeto_cafe/blob/main/imagens/diagrama_cafe_aroma.png)

---

## 🏗️ Estrutura das Tabelas

O banco de dados é composto pelas seguintes tabelas:

### `endereco`
Armazena os dados de endereçamento para clientes, funcionários e filiais.
- `id_endereco` (Chave Primária)
- `rua`
- `numero`
- `cidade`
- `estado`
- `complemento`
- `cep`

### `promocao`
Contém informações sobre as promoções oferecidas.
- `id_promocao` (Chave Primária)
- `nome`
- `descricao`
- `data_inicio`
- `data_fim`
- `desconto_percentual`

### `cafe`
Registra os tipos de grãos de café utilizados.
- `id_cafe` (Chave Primária)
- `nome`
- `pais`
- `sabor`
- `quantidade`
- `unidade_medida`

### `ingrediente`
Armazena os ingredientes utilizados na preparação dos produtos.
- `id_ingrediente` (Chave Primária)
- `nome`
- `preco_unidade`
- `quantidade`
- `unidade_medida`

### `filial`
Guarda as informações de cada filial da cafeteria.
- `id_filial` (Chave Primária)
- `nome`
- `cnpj`
- `id_endereco` (Chave Estrangeira para `endereco`)

### `cliente`
Armazena os dados dos clientes cadastrados.
- `id_cliente` (Chave Primária)
- `nome`
- `sobrenome`
- `cpf`
- `email`
- `sexo`
- `data_cadastro`
- `id_endereco` (Chave Estrangeira para `endereco`)

### `departamento`
Define os departamentos dentro de cada filial.
- `id_departamento` (Chave Primária)
- `nome`
- `id_filial` (Chave Estrangeira para `filial`)

### `funcionario`
Contém as informações dos funcionários.
- `id_funcionario` (Chave Primária)
- `nome`
- `sobrenome`
- `cpf`
- `sexo`
- `id_endereco` (Chave Estrangeira para `endereco`)
- `id_departamento` (Chave Estrangeira para `departamento`)

### `produto`
Registra os produtos vendidos na cafeteria.
- `id_produto` (Chave Primária)
- `nome`
- `preco_unitario`
- `data_validade`
- `quantidade`
- `unidade_medida`
- `id_cafe` (Chave Estrangeira para `cafe`)

### `pedido`
Armazena os detalhes de cada pedido realizado.
- `id_pedido` (Chave Primária)
- `data_pedido`
- `forma_pagamento`
- `total`
- `id_filial` (Chave Estrangeira para `filial`)
- `id_funcionario` (Chave Estrangeira para `funcionario`)
- `id_cliente` (Chave Estrangeira para `cliente`)
- `id_produto` (Chave Estrangeira para `produto`)

### `item_pedido`
Detalha os produtos contidos em cada pedido.
- `id_item_pedido` (Chave Primária)
- `preco_unitario`
- `quantidade`
- `id_produto` (Chave Estrangeira para `produto`)

### Tabelas de Relacionamento e Contato
- `telefone_cliente`: Telefones dos clientes.
- `telefone_filial`: Telefones das filiais.
- `email_filial`: E-mails das filiais.
- `telefone_funcionario`: Telefones dos funcionários.
- `email_funcionario`: E-mails dos funcionários.
- `pedido_usa_promocao`: Relaciona pedidos a promoções aplicadas.
- `produtos_ingredientes`: Relaciona produtos aos seus ingredientes.

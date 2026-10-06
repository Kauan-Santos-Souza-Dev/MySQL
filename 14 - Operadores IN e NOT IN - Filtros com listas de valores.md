### **1. O Operador `IN`**

O operador **IN** verifica se o valor armazenado em uma determinada coluna **pertence a uma lista fornecida**[1][2]. Se o valor do campo for encontrado em qualquer uma das posições da lista, a condição é avaliada como verdadeira e o registro é incluído no resultado[2].

- **Sintaxe Geral**:

```
SELECT coluna1, coluna2
FROM nome_da_tabela
WHERE coluna_filtro IN (valor1, valor2, valor3, ...);

```

- **Vantagem sobre o** **OR**: Em vez de escrever uma instrução longa como:

```
WHERE ID_editora = 2 OR ID_editora = 4;

```

Você pode simplificar a leitura e a escrita do código utilizando o `IN`[3]:

```
SELECT nome_livro, ID_editora
FROM tbl_livro
WHERE ID_editora IN (2, 4);

```

_(Esta consulta retorna apenas os livros cujos códigos de editora sejam exatamente_ _2_ _ou_ _4_ *)*[3].

---

### **2. O Operador `NOT IN`**

O operador **NOT IN** realiza a **negação** da busca[1][2]. Ele filtra o conjunto de dados para retornar apenas as linhas cujo valor na coluna **não esteja presente** na lista especificada[2].

- **Sintaxe Geral**:

```
SELECT coluna1, coluna2
FROM nome_da_tabela
WHERE coluna_filtro NOT IN (valor1, valor2, ...);

```

- **Exemplo Prático**: Para buscar todos os livros cadastrados, exceto aqueles que pertencem à 1ª ou à 2ª edição[3][4]:

```
SELECT nome_livro, edicao
FROM tbl_livro
WHERE edicao NOT IN (1, 2);

```

*(O banco de dados ignora os registros das edições 1 e 2, retornando apenas as edições mais recentes, como a 3ª e a 4ª)*[4].

---

### **3. Uso de `IN` e `NOT IN` com Subconsultas (_Subqueries_)**

Além de passar listas literais e fixas (como números ou textos entre aspas), uma das aplicações mais poderosas dos operadores `IN` e `NOT IN` é o uso em conjunto com **subconsultas**[5].

Nesse cenário, a lista de valores não é digitada manualmente; em vez disso, ela é gerada dinamicamente pelo resultado de um comando `SELECT` interno[5][7].

- **Exemplo Prático**: Suponha que você queira consultar os livros publicadas pelas editoras `'Wiley'` e `'Microsoft Press'`, mas não sabe os códigos numéricos (`ID_editora`) dessas empresas[5][6]. É possível criar uma subconsulta para buscar esses IDs na tabela de editoras e alimentá-los diretamente no operador `IN` da consulta principal[5]:

```
SELECT nome_livro, ID_editora
FROM tbl_livro
WHERE ID_editora IN (
    SELECT ID_editora
    FROM tbl_editoras
    WHERE nome_editora = 'Wiley' OR nome_editora = 'Microsoft Press'
);

```

- **Fluxo de Execução**:
    1. O MySQL executa primeiro a consulta interna entre parênteses, que busca na tabela `tbl_editoras` os códigos numéricos correspondentes aos nomes `'Wiley'` e `'Microsoft Press'` (retornando, por exemplo, a lista `3, 4`)[6][7].
    2. A lista de IDs gerada alimenta a cláusula `WHERE ID_editora IN (3, 4)` da consulta externa[7].
    3. A consulta externa finaliza o filtro trazendo os livros dessas duas editoras sem a necessidade de realizar junções complexas com `JOIN`[5][7].
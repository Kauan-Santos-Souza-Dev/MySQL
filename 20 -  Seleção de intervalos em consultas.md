A **seleção de intervalos em consultas** no MySQL é realizada utilizando a cláusula/operador **`BETWEEN`** dentro da instrução `WHERE` (ou `HAVING`). Esse operador permite filtrar os registros de uma tabela selecionando apenas os valores que estejam compreendidos dentro de uma faixa ou intervalo específico.

---

### 1. Sintaxe Geral do `BETWEEN`

A estrutura básica para selecionar registros em um intervalo de valores é:

```
SELECT colunas
FROM nome_da_tabela
WHERE coluna BETWEEN valor1 AND valor2;
```

- **`coluna`**: O campo da tabela cujo valor será avaliado em relação ao intervalo.
- **`BETWEEN`**: O operador de seleção de intervalo.
- **`valor1 AND valor2`**: Define o limite inicial (inferior) e o limite final (superior) do intervalo, conectados obrigatoriamente pela palavra `AND`.

---

### 2. Características do Operador `BETWEEN`

- **Comportamento Inclusivo**: Os limites (`valor1` e `valor2`) são **inclusivos**. Isso significa que se um registro possuir um valor exatamente igual ao limite inferior ou ao limite superior, ele será incluído no resultado da consulta.
- **Equivalência Lógica**: A expressão `coluna BETWEEN a AND b` equivale à condição relacional `(coluna >= a AND coluna <= b)`, mas oferece uma sintaxe mais legível e concisa.
- **Tipos de Dados Suportados**: O operador pode ser aplicado sobre números inteiros e decimais, datas (`DATE`/`DATETIME`) e cadeias de caracteres (_strings_).

---

### 3. Exemplos Práticos de Uso

#### A) Intervalo de Datas

Para consultar livros cujas datas de publicação estejam compreendidas entre `17 de maio de 2004` e `17 de maio de 2011`:

```
SELECT *
FROM tbl_livro
WHERE data_pub BETWEEN '2004-05-17' AND '2011-05-17';
```

- **Funcionamento**: O MySQL analisa a coluna `data_pub` e retorna somente os livros lançados a partir de 17/05/2004 até 17/05/2011. Registros com datas anteriores a 2004 ou posteriores a 2011 são ignorados pelo filtro.

Também é possível combinar funções de extração de data com o `BETWEEN`:

```
SELECT nome_livro, data_pub
FROM tbl_livro
WHERE YEAR(data_pub) BETWEEN 2015 AND 2020;
```

_(Esta consulta extrai o ano da data de publicação e retorna apenas os títulos lançados no intervalo de 2015 a 2020)_.

#### B) Intervalo Numérico e Monetário

Para selecionar os livros com preços situados na faixa de R$ 40,00 a R$ 60,00:

```
SELECT nome_livro AS livro, preco_livro AS preço
FROM tbl_livro
WHERE preco_livro BETWEEN 40.00 AND 60.00;
```

- **Resultado**: Retorna os livros cujo valor esteja na faixa declarada (por exemplo, itens custando R$ 45,00 e R$ 58,00), deixando de fora valores abaixo de 40 ou acima de 60.

---

### 4. Invertendo a Busca com `NOT BETWEEN`

Quando o objetivo é selecionar registros que **NÃO pertençam** ao intervalo especificado, utiliza-se a instrução **`NOT BETWEEN`**.

```
SELECT colunas
FROM nome_da_tabela
WHERE coluna NOT BETWEEN valor1 AND valor2;
```

#### Exemplo Prático:

Para retornar os livros cujo preço **não esteja** na faixa entre R$ 150,00 e R$ 200,00:

```
SELECT nome_livro, preco_livro
FROM tbl_livro
WHERE preco_livro NOT BETWEEN 150.00 AND 200.00;
```

- **Resultado**: O banco de dados retorna apenas os livros que custam **menos de R$ 150,00** ou **mais de R$ 200,00**, ignorando qualquer valor que caia no intervalo interno de 150 a 200.

---

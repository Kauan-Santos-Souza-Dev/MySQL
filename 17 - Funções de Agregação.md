As **Funções de Agregação** no MySQL são instruções em SQL projetadas para realizar cálculos e operações matemáticas sobre um conjunto de valores contidos em uma determinada coluna de uma tabela, retornando um **único valor resumido**.

Essas funções são essenciais em análises de dados, relatórios e consultas estatísticas.

---

### 1. Sintaxe Geral e Parâmetros

A estrutura genérica de uma função de agregação é a seguinte:

```
NOME_DA_FUNCAO([ALL | DISTINCT] coluna_ou_expressao)
```

- **`ALL`**: É o comportamento padrão do MySQL. Avalia **todos os registros** da coluna ao efetuar o cálculo de agregação (não é necessário digitar a palavra `ALL`).
- **`DISTINCT`**: Força a função de agregação a avaliar **apenas os valores distintos e exclusivos**, eliminando duplicatas antes de realizar a operação.

---

### 2. As 5 Principais Funções de Agregação

#### A) `COUNT()` — Contagem de Registros

A função **`COUNT()`** calcula a quantidade de itens ou linhas retornadas em uma consulta.

- **`COUNT(*)`**: Conta todas as linhas/registros existentes em uma tabela.
    
    ```
    SELECT COUNT(*) FROM tbl_autores;
    ```
    
- **`COUNT(DISTINCT coluna)`**: Conta apenas a quantidade de valores únicos presentes naquela coluna, desconsiderando repetições.
    
    ```
    SELECT COUNT(DISTINCT ID_autor) FROM tbl_livro;
    ```
    

#### B) `SUM()` — Soma Total

A função **`SUM()`** calcula a **soma aritmética total** de todos os valores numéricos armazenados em uma coluna.

```
SELECT SUM(preco_livro) FROM tbl_livro;
```

#### C) `AVG()` — Média Aritmética

A função **`AVG()`** (do inglês _Average_) calcula a **média aritmética** dos valores contidos em uma coluna numérica.

```
SELECT AVG(preco_livro) FROM tbl_livro;
```

#### D) `MIN()` — Valor Mínimo

A função **`MIN()`** analisa os registros de uma coluna e extrai o **menor valor** encontrado.

```
SELECT MIN(preco_livro) FROM tbl_livro;
```

#### E) `MAX()` — Valor Máximo

A função **`MAX()`** analisa os registros de uma coluna e extrai o **maior valor** encontrado.

```
SELECT MAX(preco_livro) FROM tbl_livro;
```

---

### 3. Comportamento com Valores Nulos (`NULL`)

Um detalhe importante na execução das funções de agregação é o tratamento de dados ausentes:

- **Descarte Automático**: As funções de agregação (`SUM`, `AVG`, `MIN`, `MAX` e `COUNT(coluna)`) **ignoram automaticamente os valores `NULL`** ao realizar suas operações. Em um cálculo de média com `AVG()`, por exemplo, as linhas com valor `NULL` não entram no divisor da média.
- **Exceção com `COUNT(*)`**: A instrução `COUNT(*)` contabiliza todas as linhas do conjunto de resultados, **mesmo que contenham valores nulos**.

---

### 4. Integração com `GROUP BY` e `HAVING`

#### A) Agrupamento com `GROUP BY`

Quando utilizadas isoladamente, as funções de agregação retornam apenas um valor para a tabela inteira. Ao combiná-las com a cláusula **`GROUP BY`**, a tabela é dividida em **subgrupos**, e a função de agregação calcula o resultado para **cada subgrupo separadamente**.

```
SELECT cidade, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY cidade;
```

_Neste exemplo, em vez de somar a tabela inteira, o MySQL calcula a soma das vendas especificamente para cada cidade._

#### B) Filtragem de Grupos com `HAVING`

Enquanto a cláusula `WHERE` filtra as linhas antes da agregação, a cláusula **`HAVING`** é aplicada **após o agrupamento**, permitindo filtrar os resultados baseando-se no valor calculado pela própria função de agregação.

```
SELECT cidade, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY cidade
HAVING SUM(quantidade) > 2500;
```

_Esta consulta exibe apenas as cidades cujo somatório total de vendas tenha ultrapassado 2.500 unidades._

---

### **1. O que é a Cláusula `WHERE`?**

A cláusula **WHERE** (que significa "onde" em inglês) é utilizada para **filtrar os registros retornados por uma consulta** **SELECT**[1].

Em consultas simples sem o `WHERE`, o banco de dados retorna todas as linhas de uma coluna ou tabela[1]. No entanto, frequentemente é necessário obter dados apenas de registros específicos (ou de um conjunto restrito de linhas)[1]. A cláusula `WHERE` permite definir uma condição lógica para que apenas os registros que satisfaçam essa condição sejam exibidos[1].

---

### **2. Sintaxe Geral**

A estrutura básica do comando de consulta com filtragem é[1]:

``` sql
SELECT colunas
FROM nome_da_tabela
WHERE coluna = valor;

```

- **SELECT**: Especifica quais colunas devem ser retornadas[1].
- **FROM**: Indica a tabela de origem dos dados[1].
- **WHERE**: Estabelece a condição de filtragem onde a coluna informada deve corresponder ao valor especificado[1].

---

### **3. Exemplos Práticos Demonstrados na Aula**

#### **A) Filtragem por Valores Numéricos**

Se executado sem o `WHERE`, o comando traz o nome e a data de publicação de todos os livros cadastrados na tabela[2]. Para filtrar e exibir apenas os livros escritos por um autor específico (por exemplo, de `ID_autor = 1`), utiliza-se[2]:

``` sql 
SELECT nome_livro, data_pub
FROM tbl_livro
WHERE ID_autor = 1;

```

- **Resultado**: O MySQL filtra o conjunto de dados e retorna apenas o livro correspondente a esse autor (no caso do banco de testes, o livro _"SSH, the Secure Shell"_)[3].

#### **B) Filtragem por Cadeias de Texto (_Strings_)**

Para filtrar colunas de texto (como o sobrenome de um autor), o valor pesquisado deve ser **obrigatoriamente envolvido por aspas simples**[2].

``` sql
SELECT ID_autor, nome_autor
FROM tbl_autores
WHERE sobrenome_autor = 'Stallings';

```

- **Resultado**: O MySQL faz a busca na tabela de autores e retorna exclusivamente o registro do autor cujo sobrenome seja `'Stallings'` (retornando o `ID_autor` 4 e o nome _"William"_)[2][4].

---

### **4. Diferença de Comportamento (Com vs. Sem `WHERE`)**

Durante a aula, o instrutor demonstra no MySQL Workbench que:

- **Sem a cláusula** **WHERE**: A consulta vasculha e lista a tabela inteira (sejam 5, 10.000 ou 20.000 registros)[2].
- **Com a cláusula** **WHERE**: Apenas as linhas que atendem perfeitamente ao critério lógicos definido são selecionadas e exibidas no painel de resultados[1].

---

### **5. Operadores de Comparação e Próximos Passos**

Embora a aula foque no operador de igualdade (`=`)[1][5], a cláusula `WHERE` suporta diversos outros operadores condicionais e relacionais, como[5]:

- **Maior que** (`&gt;`) e **Menor que** (`&lt;`)[5].
- **Maior ou igual** (`&gt;=`) e **Menor ou igual** (`&lt;=`)[5].
- **Diferente de** (`&lt;&gt;` ou `!=`)[5].
- **Operadores Lógicos**: Podem ser combinados com `AND`, `OR` e `NOT` para criar filtros mais avançados com múltiplas condições simultâneas[5].
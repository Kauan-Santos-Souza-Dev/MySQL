### **1. Conceito dos Operadores Lógicos**

Quando precisamos aplicar filtros mais complexos no banco de dados, uma única condição no `WHERE` pode não ser suficiente[1]. Os operadores lógicos permitem avaliar duas ou mais expressões condicionais simultaneamente[1]:

- **AND** **(E)**: Retorna um registro somente se **todas** as condições avaliadas forem verdadeiras ao mesmo tempo[1].
- **OR** **(OU)**: Retorna o registro se **ao menos uma** das condições avaliadas for verdadeira[1].
- **NOT** **(NÃO / Negação)**: Inverte o resultado de uma expressão lógica; se a condição for verdadeira, o `NOT` a torna falsa, e vice-versa[1][2].

---

### **2. Operador Lógico `AND`**

O operador `AND` é utilizado quando exigimos a satisfação simultânea de todos os critérios declarados[1][3].

- **Exemplo Prático**:

```
SELECT * FROM tbl_livro
WHERE ID_livro &gt; 2 AND ID_autor &lt; 3;

```

- **Funcionamento**: O MySQL analisa cada linha e verifica se o campo `ID_livro` é maior que 2 **E** se o campo `ID_autor` é menor que 3[3]. Se ambas as condições forem verdadeiras, o registro é retornado no resultado[3].
- **Resultado na Aula**: No banco de dados de teste, apenas 1 registro atendeu às duas exigências ao mesmo tempo (o livro com `ID_livro = 3` e `ID_autor = 2`)[4].

---

### **3. Operador Lógico `OR`**

O operador `OR` amplia o escopo da busca, retornando o registro se qualquer uma das condições for satisfeita, não exigindo simultaneidade[1][5].

- **Exemplo Prático**:

```
SELECT * FROM tbl_livro
WHERE ID_livro &gt; 2 OR ID_autor &lt; 3;

```

- **Funcionamento**: O MySQL retorna o livro se o seu `ID_livro` for maior que 2 (independentemente de quem seja o autor) **OU** se o seu `ID_autor` for menor que 3 (independentemente de qual seja o ID do livro)[5].
- **Resultado na Aula**: Essa consulta retorna muito mais linhas do que a consulta com `AND`, pois funciona como uma soma dos resultados de ambas as condições[5][6].

---

### **4. Operador Lógico `NOT`**

O operador `NOT` realiza a negação de uma comparação lógica[1][2].

- **Exemplo Prático**:

```
SELECT * FROM tbl_livro
WHERE ID_livro &gt; 2 AND NOT ID_autor &lt; 3;

```

- **Funcionamento**: A expressão relacional `ID_autor &lt; 3` retornaria originalmente os autores 1 e 2[2]. Contudo, com o `NOT` na frente, a lógica é invertida: o filtro passa a aceitar apenas os autores cujo ID seja **3 ou maior**[2][7].
- **Resultado na Aula**: O MySQL lista os livros com `ID_livro` maior que 2, mas cujos autores sejam de ID 3 em diante[7].
### **1. O que é a Cláusula `ORDER BY`?**

A cláusula **ORDER BY** (ordenar por) é utilizada ao final do comando `SELECT` para reordenar as linhas retornadas pela consulta[1][2].

Sem essa cláusula, o MySQL retorna os registros na ordem em que foram gravados no banco ou na ordem física do índice. Com o `ORDER BY`, você pode organizar textos em ordem alfabética, números do menor para o maior (ou vice-versa) e datas da mais antiga para a mais recente[1][3].

Quando uma coluna é ordenada, **todos os dados correspondentes àquela linha acompanham a nova posição**, garantindo a integridade do registro[4].

---

### **2. Direções de Ordenação: `ASC` e `DESC`**

A ordenação pode ser realizada em duas direções[1]:

- **ASC** **(Ascendente / Crescente)**:
    - Ordena os dados do menor para o maior (ex.: de 1 a 10, de A a Z, da data mais antiga para a mais recente)[1].
    - **Comportamento Padrão**: O uso da palavra-chave `ASC` é **opcional**. Se você omiti-la, o MySQL aplicará a ordenação ascendente por padrão[3][5].
- **DESC** **(Descendente / Decrescente)**:
    - Ordena os dados do maior para o menor (ex.: de 10 a 1, de Z a A, da data mais recente para a mais antiga)[1].
    - **Uso Obrigatório**: Para obter a ordem decrescente ou inversa, é **obrigatório** incluir a palavra `DESC`[5].

---

### **3. Exemplos Práticos Demonstrados na Aula**

#### **A) Ordenação Alfabética Simples (Crescente)**

Para listar todos os livros em ordem alfabética de título[1][4]:

```
SELECT * FROM tbl_livro
ORDER BY nome_livro ASC;

```

_(Como_ _ASC_ _é o padrão, o mesmo resultado é obtido executando_ _SELECT * FROM tbl_livro ORDER BY nome_livro;_[3][5]_)._

#### **B) Ordenação Alfabética Inversa (Decrescente)**

Para listar os livros de Z a A[2]:

```
SELECT * FROM tbl_livro
ORDER BY nome_livro DESC;

```

#### **C) Ordenação por Chaves / Códigos Inteiros**

Para agrupar os livros pelo código da editora (`ID_editora`)[2][3]:

```
SELECT nome_livro, ID_editora
FROM tbl_livro
ORDER BY ID_editora;

```

#### **D) Ordenação Numérica / Monetária (Do Mais Caro para o Mais Barato)**

MUITO comum em sistemas de e-commerce para exibir itens com maior preço primeiro[2][3]:

```
SELECT nome_livro, preco_livro
FROM tbl_livro
ORDER BY preco_livro DESC;

```

#### **E) Ordenação Numérica / Monetária (Do Mais Barato para o Mais Caro)**

Para filtrar os preços da menor quantia para a maior[3]:

```
SELECT nome_livro, preco_livro
FROM tbl_livro
ORDER BY preco_livro ASC;
```
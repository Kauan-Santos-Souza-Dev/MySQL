O vídeo **"MySQL - SELECT - Realizar Consultas simples em Tabelas - 12"**, apresentado por Fábio da Bóson Treinamentos, marca o início do estudo das consultas em SQL, apresentando a instrução DQL **`SELECT`** em sua forma mais simples e fundamental.

Abaixo está a explicação detalhada de todos os conceitos, comandos e exemplos apresentados na aula:

---

### 1. Conceito do Comando `SELECT`

O comando `SELECT` é a instrução da linguagem SQL utilizada para extrair, consultar e verificar informações que já estão armazenadas dentro do banco de dados. Ele permite recuperar dados de uma ou mais tabelas.

---

### 2. Sintaxe Geral da Consulta Simples

A estrutura básica de uma consulta simples especifica as colunas desejadas e a tabela de origem:

```
SELECT coluna1, coluna2, ...
FROM nome_da_tabela;
```

- **`SELECT`**: Define quais campos/colunas serão retornados no resultado.
- **`FROM`**: Especifica a tabela que contém as colunas consultadas.

---

### 3. Modos de Consulta Apresentados na Aula

#### A) Consultar uma Coluna Específica

Para trazer todos os registros contidos em apenas uma coluna de uma tabela, informa-se diretamente o nome da coluna:

```
SELECT nome_autor FROM tbl_autores;
```

- **Comportamento**: O comando retorna a coluna inteira com todos os registros armazenados nela (neste caso, todos os nomes de autores cadastrados na tabela).

#### B) Consultar Todas as Colunas de uma Tabela (`*`)

Utiliza-se o caractere coringa **`*`** (asterisco) quando se deseja visualizar a estrutura e o conteúdo completo de todas as colunas de uma tabela:

```
SELECT * FROM tbl_autores;
```

- **Resultado**: Retorna todas as colunas existentes na tabela (`ID_autor`, `nome_autor` e `sobrenome_autor`) com todas as suas respectivas linhas.

#### C) Consultar Algumas Colunas Selecionadas

Para retornar apenas um grupo específico de colunas (e não apenas uma nem todas), listam-se os nomes dos campos separados por vírgula:

```
SELECT nome_livro, isbn FROM tbl_livro;
```

- Também é possível adicionar mais colunas à lista, como a data de publicação:
    
    ```
    SELECT nome_livro, isbn, data_pub FROM tbl_livro;
    ```
    

---

### 4. Limitações do `SELECT` Simples

O instrutor ressalta duas características importantes deste formato inicial do comando:

1. **Retorno de Linhas**: Na consulta simples apresentada, o `SELECT` retorna todas as linhas/registros existentes na coluna sem filtragem (a filtragem de registros específicos é realizada com a cláusula `WHERE`, abordada na aula 14).
2. **Origem de Dados**: O formato simples consulta os dados de apenas **uma tabela por vez**. Para combinar informações de duas ou mais tabelas relacionadas (como exibir o nome do livro junto com o nome do autor), é necessário utilizar a cláusula de junção **`JOIN`**.

---

💡 Deseja continuar para a **Aula 13** sobre ordenação de resultados com **`ORDER BY`**, ou prefere ir direto para a **Aula 14** sobre filtros com a cláusula **`WHERE`**?
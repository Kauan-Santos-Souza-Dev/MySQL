No MySQL, o **Alias** (apelido) é um nome temporário atribuído a uma **coluna** ou a uma **tabela** durante a execução de uma consulta SQL. Ele existe apenas enquanto a consulta é processada para formatar o conjunto de resultados (_result set_) ou simplificar a escrita do código.

Para criar um alias, utiliza-se a palavra-chave **`AS`** inserida logo após o nome original da coluna ou da tabela, seguida pelo apelido desejado.

---

### 1. Sintaxe Geral

``` MYSQL
SELECT coluna_original AS apelido_coluna
FROM tabela_original AS apelido_tabela;
```

---

### 2. Alias para Colunas

É utilizado para renomear os cabeçalhos de exibição no resultado da consulta, tornando-os mais legíveis, amigáveis ou adequados para relatórios e formulários.

- **Exemplo Simples**:
    
    ```
    SELECT nome_livro AS livros
    FROM tbl_livro;
    ```
    
    _(Em vez de exibir o cabeçalho técnico `nome_livro`, o MySQL exibirá apenas `livros` no resultado)._
    
- **Exemplo com Múltiplas Colunas e Acentuação**:
    
    ```
    SELECT nome_livro AS livros, preco_livro AS preço
    FROM tbl_livro;
    ```
    
    _(Permite utilizar caracteres especiais ou acentuação no alias da coluna)._
    
- **Uso com Funções e Campos Calculados**: Quando realizamos cálculos ou usamos funções como `CONCAT`, `COUNT` ou `SUM`, o cabeçalho padrão retornado pelo MySQL é o próprio código da função. O uso do `AS` atribui um nome limpo ao resultado:
    
    ```
    SELECT CONCAT(nome_autor, ' ', sobrenome_autor) AS nome_completo
    FROM tbl_autores;
    ```
    

---

### 3. Alias para Tabelas

É amplamente utilizado quando realizamos consultas em múltiplas tabelas conectadas por junções (`INNER JOIN`, `LEFT JOIN`, etc.). Ao definir apelidos curtos para as tabelas, evita-se a repetição de nomes longos e previne-se ambiguidades caso colunas de tabelas diferentes possuam o mesmo nome.

- **Exemplo em Consultas com `JOIN`**:
    
    ```
    SELECT l.nome_livro AS livro, e.nome_editora AS editora
    FROM tbl_livro AS l
    INNER JOIN tbl_editoras AS e
        ON l.ID_editora = e.ID_editora;
    ```
    
    - **`tbl_livro AS l`**: Define `l` como o apelido da tabela de livros.
    - **`tbl_editoras AS e`**: Define `e` como o apelido da tabela de editoras.
    - Nas cláusulas `SELECT` e `ON`, utilizamos os prefixos curtos `l.` e `e.` para indicar a qual tabela a coluna pertence.

---

### 4. Boas Práticas e Observações

1. **Uso de Aspas**: Se o alias contiver espaços em branco ou palavras compostas, ele deve ser envolvido por aspas simples:
    
    ```
    SELECT nome_livro AS 'Nome do Livro' FROM tbl_livro;
    ```
    
2. **Opcionalidade da palavra `AS`**: No MySQL, a palavra-chave `AS` é opcional (por exemplo, `SELECT nome_livro livro`). No entanto, o seu uso é altamente recomendado por boas práticas de legibilidade do código SQL.

---

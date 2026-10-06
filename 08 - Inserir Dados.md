### **1. Sintaxe Geral do Comando `INSERT INTO`**

Para inserir dados em uma tabela, especifica-se o nome da tabela, a lista de colunas que receberão os dados e, em seguida, os valores correspondentes entre parênteses[1]:

``` SQL 
INSERT INTO nome_da_tabela (coluna1, coluna2, coluna3)
VALUES (valor1, valor2, valor3);

```

- **Correspondência de Posição**: Os valores declarados na cláusula `VALUES` devem seguir exatamente a mesma ordem das colunas especificadas no primeiro parêntese[1].
- **Tipos de Dados Literais**: Textos (`VARCHAR`, `CHAR`) e datas devem ser envolvidos por aspas simples[2][3].

---

### **2. Integridade Referencial e Ordem Lógica de Inserção**

Antes de executar inserções em bancos de dados relacionais, é fundamental respeitar a **integridade referencial**[4]:

- **Tabelas Pai vs. Tabelas Filho**: Não se deve tentar inserir registros em uma tabela que contenha chaves estrangeiras (`FOREIGN KEY`) sem que os registros referenciados já existam nas tabelas pai[4].
- **Ordem Prática no Banco** **DB biblioteca**:
    1. Primeiro insere-se dados nas tabelas independentes: **tbl_autores** e **tbl_editoras**[4][5].
    2. Apenas após cadastrar autores e editoras insere-se dados em **tbl_livro**, informando nos campos de chave estrangeira (`ID_autor` e `ID_editora`) os códigos de autores e editoras válidos[4].

---

### **3. Inserção em Tabelas com `AUTO_INCREMENT`**

Ao inserir dados em tabelas onde a chave primária possui a restrição `AUTO_INCREMENT` (como a tabela `tbl_editoras`), **não é necessário especificar a coluna de ID** na lista de campos[8].

- **Exemplo na tabela** **tbl_editoras**:

``` SQL 
INSERT INTO tbl_editoras (nome_editora)
VALUES ('Prentice Hall'), ('O''Reilly'), ('Microsoft Press'), ('Wiley');

```

- **Funcionamento**: O MySQL gera e atribui a sequência numérica automática para a coluna `ID_editora` sem intervenção manual[8].

---

### **4. Inserção Múltipla de Registros (_Batch Insert_)**

O MySQL permite incluir vários registros em um único comando `INSERT INTO`, separando os grupos de valores por vírgulas[2]:

``` SQL 
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor)
VALUES
    (1, 'Daniel', 'Barret'),
    (2, 'Richard', 'Blum'),
    (3, 'William', 'Stallings'),
    (4, 'Sanjay', 'Patel');

```

Essa técnica reduz o overhead de execução no servidor de banco de dados se comparada à execução de múltiplos comandos individuais.

---

### **5. Formatação de Dados Especiais (Datas e Decimais)**

Na tabela `tbl_livro`, há campos com formatos específicos que exigem atenção[3]:

- **Datas (** **DATE** **)**: Devem ser inseridas como _strings_ no padrão ISO **'YYYY-MM-DD'** (Ano-Mês-Dia)[3].
    - _Exemplo_: `'2020-12-01'`[3].
- **Valores Numéricos Monetários (** **DECIMAL** **)**: Devem utilizar o **ponto (** **.** **)** como separador de casas decimais em vez da vírgula[3].
    - _Exemplo_: `68.35`[3].

#### **Exemplo Prático de Inserção na Tabela de Livros:**

``` SQL 
INSERT INTO tbl_livro (nome_livro, isbn, data_pub, preco_livro, ID_autor, ID_editora)
VALUES (
    'Linux Command Line and Shell Scripting',
    '123456789',
    '2015-01-09',
    68.35,
    5,
    4
);

```

---

### **6. Verificação do Resultado com `SELECT`**

Após executar as instruções `INSERT INTO`, utiliza-se a consulta simples `SELECT * FROM nome_da_tabela;` para checar o conteúdo da tabela e confirmar se todos os registros foram salvos corretamente[2].
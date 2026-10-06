### **1. Sintaxe Geral do Comando `CREATE TABLE`**

Para criar uma tabela em um banco de dados relacional, utiliza-se a instrução **CREATE TABLE**[1].

- **Estrutura básica**:

``` SQL
CREATE TABLE [IF NOT EXISTS] nome_da_tabela (
    coluna1 tipo_de_dado restrições,
    coluna2 tipo_de_dado restrições,
    ...
);

```

- **Uso de** **IF NOT EXISTS**: É uma cláusula opcional de proteção que impede que o MySQL exiba uma mensagem de erro caso uma tabela com o mesmo nome já exista no banco de dados ativo[1].
- **Definição de Colunas**: Cada coluna é declarada indicando seu nome, o tipo de dado suportado (como `SMALLINT`, `VARCHAR`, `DATE`, `DECIMAL`) e as restrições associadas (como `PRIMARY KEY`, `AUTO_INCREMENT` e `NOT NULL`)[1][2]. As definições das colunas são separadas por vírgulas, exceto a última antes de fechar os parênteses[1][2].

---

### **2. Criação das Tabelas do Banco `DB biblioteca`**

No vídeo, o instrutor utiliza o banco de dados `DB biblioteca` (previamente selecionado com `USE DB biblioteca`) para criar a estrutura de três tabelas fundamentais[2]:

#### **A) Tabela de Livros (`tbl_livro`)**

Armazena as informações dos livros da biblioteca[1][2]:

``` SQL
CREATE TABLE IF NOT EXISTS tbl_livro (
    ID_livro SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nome_livro VARCHAR(50) NOT NULL,
    isbn VARCHAR(30) NOT NULL,
    ID_autor SMALLINT,
    data_pub DATE,
    preco_livro DECIMAL(10,2) NOT NULL
);

```

- **ID_livro**: Definido como `SMALLINT`, `PRIMARY KEY` (chave primária) e `AUTO_INCREMENT` (geração automática e sequencial do código)[2].
- **nome_livro** **e** **isbn**: Do tipo `VARCHAR`, obrigatórios (`NOT NULL`)[2].
- **ID_autor**: Campo numérico para relacionamento futuro com a tabela de autores[2][4].
- **data_pub**: Do tipo `DATE` para armazenar a data de publicação[2].
- **preco_livro**: Do tipo `DECIMAL` para armazenar valores monetários com precisão[2].

#### **B) Tabela de Autores (`tbl_autores`)**

Armazena os dados dos autores cadastrados[4]:

``` SQL
CREATE TABLE tbl_autores (
    ID_autor SMALLINT PRIMARY KEY,
    nome_autor VARCHAR(50),
    sobrenome_autor VARCHAR(50)
);

```

#### **C) Tabela de Editoras (`tbl_editoras`)**

Armazena o cadastro das editoras[4]:

``` SQL
CREATE TABLE tbl_editoras (
    ID_editora SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(50) NOT NULL
);

```

---

### **3. Verificação de Tabelas com `SHOW TABLES`**

Após executar os blocos de comando no MySQL Workbench, utiliza-se a instrução **SHOW TABLES** para listar as tabelas criadas e confirmar que a estrutura do banco de dados foi atualizada com sucesso[3][4].

---

### **4. Definição de Chave Estrangeira Inline (`FOREIGN KEY`)**

O vídeo apresenta também um exemplo de como declarar uma restrição de **Chave Estrangeira** (_Foreign Key_) diretamente no momento da criação da tabela (inline)[5][6]:

``` SQL  
CREATE TABLE compras (
    ID_compra SMALLINT PRIMARY KEY,
    codigo_produto VARCHAR(50),
    data_compra DATE,
    FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo_produto)
);

```

- A cláusula `FOREIGN KEY (coluna_local) REFERENCES tabela_pai(coluna_pai)` vincula a coluna da tabela atual a uma chave primária existente em outra tabela, estabelecendo a integridade referencial entre elas[5][6].
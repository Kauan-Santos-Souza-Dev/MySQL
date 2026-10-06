O vídeo **"MySQL - Alterar Tabelas - ALTER TABLE e visualizar Relacionamentos - 10"**, ministrado por Fábio da Bóson Treinamentos, ensina a modificar a estrutura de tabelas previamente criadas em um banco de dados utilizando a instrução DDL **`ALTER TABLE`**, além de demonstrar como gerar e visualizar graficamente o Diagrama Entidade-Relacionamento (E-R) no MySQL Workbench.

---

### 1. O Comando `ALTER TABLE`

O comando `ALTER TABLE` permite alterar a estrutura interna de uma tabela sem a necessidade de excluí-la e recriá-la do zero. Através dele, é possível adicionar ou remover colunas, alterar tipos de dados e definir ou excluir restrições (_constraints_), como chaves primárias e chaves estrangeiras.

---

### 2. Exclusão de Colunas e Chaves Primárias (`DROP`)

#### A) Excluir uma Coluna (`DROP COLUMN`)

Para remover uma coluna desnecessária de uma tabela, utiliza-se a cláusula `DROP COLUMN`.

- **Sintaxe**:
    
    ```
    ALTER TABLE nome_da_tabela DROP COLUMN nome_da_coluna;
    ```
    
- **Exemplo do vídeo**: Exclusão da coluna `ID_autor` na tabela de livros (`tbl_livro`) do banco `DB biblioteca`:
    
    ```
    ALTER TABLE tbl_livro DROP COLUMN ID_autor;
    ```
    

#### B) Excluir uma Chave Primária (`DROP PRIMARY KEY`)

Como cada tabela possui no máximo uma única Chave Primária, não é necessário especificar o nome da coluna ao removê-la, bastando utilizar o comando `DROP PRIMARY KEY`:

```
ALTER TABLE nome_da_tabela DROP PRIMARY KEY;
```

---

### 3. Adição de Colunas e Chaves Estrangeiras (`ADD`)

#### A) Adicionar uma Coluna (`ADD`)

Para inserir um novo campo em uma tabela existente, utiliza-se a cláusula `ADD` especificando o nome do campo, o tipo de dado e eventuais restrições.

- **Sintaxe**:
    
    ```
    ALTER TABLE nome_da_tabela ADD nome_da_coluna tipo_de_dado restricoes;
    ```
    
- **Exemplo**: Adicionando novamente a coluna `ID_autor` na tabela `tbl_livro`:
    
    ```
    ALTER TABLE tbl_livro ADD ID_autor SMALLINT NOT NULL;
    ```
    

#### B) Adicionar Restrição de Chave Estrangeira (`ADD CONSTRAINT ... FOREIGN KEY`)

Para conectar duas tabelas e garantir a integridade referencial, adiciona-se uma restrição do tipo `FOREIGN KEY` vincuLando a coluna local à chave primária de outra tabela.

- **Sintaxe**:
    
    ```
    ALTER TABLE tabela_filho
    ADD CONSTRAINT nome_da_constraint
    FOREIGN KEY (coluna_local) REFERENCES tabela_pai(coluna_chave_primaria);
    ```
    
- **Exemplos Práticos do Vídeo**:
    
    1. **Relacionamento entre `tbl_livro` e `tbl_autores`**:
        
        ```
        ALTER TABLE tbl_livro
        ADD CONSTRAINT FK_ID_autor
        FOREIGN KEY (ID_autor) REFERENCES tbl_autores(ID_autor);
        ```
        
    2. **Relacionamento entre `tbl_livro` e `tbl_editoras`** (após adicionar a coluna `ID_editora`):
        
        ```
        -- 1º Passo: Adiciona a coluna ID_editora
        ALTER TABLE tbl_livro ADD ID_editora SMALLINT NOT NULL;
        
        -- 2º Passo: Adiciona a FK conectando à tabela de editoras
        ALTER TABLE tbl_livro
        ADD CONSTRAINT FK_ID_editora
        FOREIGN KEY (ID_editora) REFERENCES tbl_editoras(ID_editora);
        ```
        

---

### 4. Outras Alterações Estruturais

#### A) Modificar o Tipo de Dado de uma Coluna

Caso seja necessário alterar o tipo de dado ou o tamanho de um campo sem excluí-lo, utiliza-se a cláusula `ALTER COLUMN` / `MODIFY COLUMN`:

```
ALTER TABLE tbl_livro ALTER COLUMN nome_livro VARCHAR(100);
```

#### B) Adicionar Chave Primária a uma Tabela Existente

Se uma tabela foi criada sem chave primária, é possível defini-la posteriormente:

```
ALTER TABLE tbl_clientes ADD PRIMARY KEY (ID_cliente);
```

---

### 5. Visualização de Relacionamentos no MySQL Workbench (Engenharia Reversa)

Após estabelecer os relacionamentos via SQL, o vídeo demonstra como gerar automaticamente o Diagrama Entidade-Relacionamento (E-R) no MySQL Workbench através da **Engenharia Reversa** (_Reverse Engineer_):

1. Na tela inicial do MySQL Workbench, acesse a seção **Data Modeling**.
2. Clique na opção **`Create ER Model from Existing Database`**.
3. Selecione a conexão do servidor, insira a senha e escolha o banco de dados desejado (ex: `DB biblioteca`).
4. Mantenha marcada a opção **"Place imported objects on a diagram"** e conclua o assistente.
5. **Resultado Visual**: O MySQL Workbench gera o diagrama mostrando as tabelas (`tbl_livro`, `tbl_autores`, `tbl_editoras`) conectadas por linhas de relacionamento de **1 para muitos** (1:N), permitindo inspecionar visualmente como as chaves estrangeiras vinculam os registros entre as tabelas.

---

🔍 Gostaria de avançar para a **aula 11** sobre a inserção de registros nas tabelas com o comando `INSERT INTO`, ou prefere explorar as técnicas de consulta com `SELECT` e `INNER JOIN`?

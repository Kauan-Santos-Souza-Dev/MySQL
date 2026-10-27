A restrição **`DEFAULT`** (valor padrão) no MySQL é utilizada para definir um valor predeterminado para uma coluna em uma tabela. Esse valor é gravado automaticamente no registro sempre que um comando `INSERT INTO` for executado omitindo o campo correspondente.

---

### 1. Conceito e Finalidade da Restrição `DEFAULT`

Essa funcionalidade é especialmente útil quando uma determinada coluna costuma receber repetidamente a mesma informação na maioria dos cadastros.

Por exemplo, em um cadastro de fornecedores ou clientes onde a grande maioria resida no estado de São Paulo, é possível definir `'SP'` como o valor padrão para a coluna de estado. Dessa forma, ao cadastrar um fornecedor, o usuário não precisa especificar essa coluna a menos que o registro pertença a outro estado (como `'RJ'`), situação em que o valor digitado explicitamente substituirá o padrão.

---

### 2. Definindo um Valor Padrão na Criação da Tabela (`CREATE TABLE`)

O valor padrão pode ser estabelecido diretamente durante a criação da estrutura da tabela. Para isso, adiciona-se a palavra-chave **`DEFAULT`** seguida do valor desejado logo após a definição do tipo de dado da coluna.

``` MySQL
CREATE TABLE tbl_fornecedores (
    ID_fornecedor SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(50) NOT NULL,
    estado CHAR(2) DEFAULT 'SP'
);
```

- Se um `INSERT` informar apenas o `nome_fornecedor`, o MySQL preencherá o campo `estado` com `'SP'`.
- Se o `INSERT` informar explicitamente `'RJ'`, o MySQL armazenará `'RJ'`.

---

### 3. Adicionando ou Alterando o Valor Padrão em Tabelas Existentes (`ALTER TABLE`)

Caso a tabela já tenha sido criada e você deseje adicionar ou alterar o valor padrão de uma coluna, utiliza-se o comando **`ALTER TABLE`** combinado com a cláusula **`MODIFY COLUMN`**.

#### Sintaxe Geral:

```
ALTER TABLE nome_da_tabela
MODIFY COLUMN nome_da_coluna tipo_de_dado DEFAULT valor_padrao;
```

#### Exemplo Prático:

Na tabela de autores (`tbl_autores`), pode-se modificar a coluna `sobrenome_autor` para definir o sobrenome `'da Silva'` como valor padrão:

```
ALTER TABLE tbl_autores
MODIFY COLUMN sobrenome_autor VARCHAR(60) DEFAULT 'da Silva';
```

---

### 4. Funcionamento Prático no `INSERT INTO`

#### A) Inserção Omitindo a Coluna

Ao realizar uma inserção sem incluir o campo que possui o valor padrão na lista de colunas do `INSERT`, o MySQL atribui o valor padrão automaticamente:

```
INSERT INTO tbl_autores (ID_autor, nome_autor)
VALUES (8, 'João');
```

Ao consultar a tabela com `SELECT * FROM tbl_autores;`, o registro exibirá o autor de ID 8 com o nome `'João'` e o sobrenome `'da Silva'` gravado automaticamente.

#### B) Inserção Fornecendo o Valor Explicitamente

Se a coluna for incluída na instrução `INSERT` e um valor for atribuído a ela, o valor informado prevalece sobre o padrão:

```
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor)
VALUES (9, 'Rita', 'de Souza');
```

Neste caso, o MySQL armazenará a autora `'Rita'` com o sobrenome `'de Souza'`, ignorando o valor padrão `'da Silva'`.

---

### 5. Remoção do Valor Padrão

Para retirar o valor padrão de uma coluna, reexecuta-se o comando `ALTER TABLE ... MODIFY COLUMN` especificando o tipo de dado da coluna, porém **omitindo a palavra-chave `DEFAULT`**:

```
ALTER TABLE tbl_autores
MODIFY COLUMN sobrenome_autor VARCHAR(60);
```

Após remover a instrução `DEFAULT`:

- O MySQL deixa de preencher o valor automático `'da Silva'` ao omitir o campo.
- Se a coluna permitir valores nulos, o MySQL preencherá o campo com **`NULL`**.
- Se a coluna contiver a restrição `NOT NULL`, o MySQL gerará um erro e impedirá a inserção caso o campo seja omitido.

---

📌 Quer ver como funcionam os campos calculados (`GENERATED ALWAYS AS`) ou prefere avançar para as consultas com agrupamento (`GROUP BY`) e filtragem (`HAVING`)?
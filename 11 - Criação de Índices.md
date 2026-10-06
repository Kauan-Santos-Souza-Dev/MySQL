A criação e o uso de **índices** no MySQL servem para otimizar a velocidade de busca e consulta de dados em tabelas[1]. O comando `CREATE INDEX` permite aplicar estruturas de indexação em colunas para evitar varreduras completas da tabela (_full table scan_), indo diretamente à localização física dos registros[1].

---

### **1. Conceito e Tipos de Índices no MySQL**

- **Índices Automáticos**: Por padrão, o MySQL cria índices automaticamente em colunas definidas como **Chave Primária** (`PRIMARY KEY`), **Chave Estrangeira** (`FOREIGN KEY`) e **Restrição de Unicidade** (`UNIQUE`)[1].
- **Índice Clusterizado (Primário)**: Altera fisicamente a ordem em que os dados são gravados e armazenados em disco[2]. Cada tabela só pode ter **um** índice clusterizado (associado à chave primária)[2][3].
- **Índice Não Clusterizado (Secundário)**: Cria um objeto separado no banco de dados que funciona como um ponteiro para a localização exata das informações no disco[3]. Uma tabela pode ter múltiplos índices não clusterizados em diferentes colunas ou combinações de colunas[3].

---

### **2. Sintaxe e Uso do `CREATE INDEX`**

Para criar um índice em uma tabela que já foi criada, utiliza-se a seguinte sintaxe[4]:

``` 
CREATE [UNIQUE] INDEX nome_do_indice
ON nome_da_tabela (coluna1 [ASC|DESC], coluna2 [ASC|DESC], ...);

```

#### **Parâmetros e Opções:**

- **UNIQUE** _(opcional)_: Garante que os valores armazenados na coluna indexada sejam exclusivos, impedindo duplicatas[4].
- **nome_do_indice**: Nome identificador do índice no banco de dados[4].
- **ON nome_da_tabela (coluna)**: Especifica em qual tabela e coluna o índice será aplicado[4].
- **ASC** **/** **DESC** _(opcional)_: Define a ordenação do índice como ascendente (padrão) ou descendente[4].
- **Índices Compostos**: É possível incluir duas ou mais colunas separadas por vírgula dentro dos parênteses para indexar uma combinação de campos[5].

#### **Exemplo Prático:**

```
CREATE INDEX idx_nome_editora
ON tbl_editoras (nome_editora);

```

_Neste exemplo, é criado o índice_ _idx_nome_editora_ _para acelerar buscas realizadas na coluna_ _nome_editora_ _da tabela_ _tbl_editoras_[6]*.*

---

### **3. Formas Alternativas de Criar Índices**

Além da instrução `CREATE INDEX`, existem duas outras formas de definir índices no MySQL:

1. **Via** **ALTER TABLE** (em tabelas existentes)[5]:

```
ALTER TABLE tbl_editoras
ADD INDEX idx_nome_editora (nome_editora);

```

1. **Diretamente no** **CREATE TABLE** (na criação da tabela)[7]:

```
CREATE TABLE tbl_editoras (
    ID_editora SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(50) NOT NULL,
    INDEX idx_nome_editora (nome_editora)
);

```

---

### **4. Verificação e Análise de Desempenho**

#### **Visualizar Índices de uma Tabela (`SHOW INDEX`)**

Para listar todos os índices existentes e suas propriedades em uma tabela específica[7][8]:

```
SHOW INDEX FROM tbl_editoras;

```

#### **Analisar o Custo da Consulta (`EXPLAIN`)**

O comando `EXPLAIN` permite verificar o plano de execução de uma consulta SQL antes de executá-la[9]:

```
EXPLAIN SELECT * FROM tbl_editoras WHERE nome_editora = 'Wiley';

```

- **Sem índice**: O MySQL lê **todas as linhas** da tabela (`rows` = total de registros) até encontrar a informação[10].
- **Com índice**: O campo `possible_keys` e `key` indicam o uso do índice e o campo `rows` reduz drasticamente (geralmente para `1`), demonstrando a otimização de leitura[11][12].

---

### **5. Remoção de Índices (`DROP INDEX`)**

Caso um índice não seja mais necessário, ele pode ser excluído com o comando `DROP INDEX`[13]:

```
DROP INDEX nome_do_indice ON nome_da_tabela;

```

#### **Exemplo:**

```
DROP INDEX idx_nome_editora ON tbl_editoras;

```

---

### **6. Boas Práticas e Recomendações**

- **Onde usar**: Crie índices em colunas frequentemente utilizadas em filtros (`WHERE`), junções de tabelas (`JOIN`) e ordenações (`ORDER BY`)[12].
- **Onde evitar**: Evite criar índices em colunas que passam por constantes alterações (`INSERT`, `UPDATE`, `DELETE`)[14]. Cada modificação na tabela exige a reconstrução e atualização de todos os seus índices, o que pode impactar o desempenho de escrita no banco de dados[13][14].
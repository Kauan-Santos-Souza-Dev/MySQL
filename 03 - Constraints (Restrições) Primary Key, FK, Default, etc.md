As restrições são regras fundamentais aplicadas às colunas de uma tabela para delimitar os tipos e formatos de dados que podem ser armazenados, garantindo a integridade e a consistência das informações no banco de dados[1]. Elas podem ser definidas no momento da criação da tabela (com a instrução `CREATE TABLE`) ou adicionadas posteriormente em uma tabela já existente através do comando `ALTER TABLE`[1].

---

### **1. `NOT NULL` (Não Nulo)**

- **Conceito**: Impõe que a coluna seja obrigada a possuir um valor em cada registro[2].
- **Funcionamento**: A restrição impede a inserção ou atualização de dados enviando o valor `NULL` (que indica ausência de informação/valor não definido, sendo diferente do número zero ou de uma _string_ vazia)[2].
- **Uso**: Deve ser utilizada em campos onde a informação é estritamente indispensável para o cadastro[2].

---

### **2. `UNIQUE` (Único)**

- **Conceito**: Garante que todos os valores armazenados em uma coluna (ou em um conjunto de colunas) sejam exclusivos, impedindo a duplicação de dados[3].
- **Diferencial**: Uma tabela pode conter **múltiplas** colunas com a restrição `UNIQUE`[4].
- **Exemplo**: O cadastro do número de CPF de um cliente. Aplicando a restrição `UNIQUE`, o sistema impede que dois clientes sejam cadastrados com o mesmo CPF; caso haja tentativa de inserção duplicada, o banco de dados rejeita a operação e gera uma mensagem de erro[4].

---

### **3. `PRIMARY KEY` (Chave Primária)**

- **Conceito**: É o identificador exclusivo de cada linha/registro em uma tabela[4][5].
- **Regras Estritas**:
    - Unifica a unicidade do `UNIQUE` e a obrigatoriedade do `NOT NULL` — ou seja, **não aceita valores repetidos** e **jamais aceita valores nulos (** **NULL** **)**[3][5].
    - Cada tabela pode possuir **apenas uma** Chave Primária[5].
- **Chave Composta**: Embora haja apenas uma chave primária por tabela, ela pode ser formada por uma única coluna (simples) ou pela combinação de duas ou mais colunas (chave composta)[5].

---

### **4. `FOREIGN KEY` (Chave Estrangeira)**

- **Conceito**: É uma coluna (ou conjunto de colunas) que aponta diretamente para a `PRIMARY KEY` de outra tabela[6].
- **Finalidade**: Estabelecer relacionamentos entre tabelas no modelo relacional, garantindo que o registro em uma tabela esteja devidamente vinculado a um registro válido na tabela pai[6].
- **Sintaxe de Exemplo**:

```
CONSTRAINT FK_autor FOREIGN KEY (ID_autor) REFERENCES autores(ID_autor)

```

Neste exemplo, o campo `ID_autor` da tabela atual (ex: tabela de livros) conecta-se com a chave primária `ID_autor` da tabela de autores[6][7].

---

### **5. `DEFAULT` (Valor Padrão)**

- **Conceito**: Define um valor padrão automático para a coluna caso nenhum valor seja fornecido explicitamente na instrução de inserção (`INSERT`)[7][8].
- **Exemplo Prático**: Se a maioria dos clientes cadastrados for do estado de São Paulo, é possível definir `'SP'` ou `'São Paulo'` como o valor padrão da coluna de estado[8]. Na inserção, se o estado for omitido, o banco preenche automaticamente com `'São Paulo'`; se o cliente for do Rio de Janeiro, o valor `'RJ'` é informado manualmente e sobrescreve o padrão[8].

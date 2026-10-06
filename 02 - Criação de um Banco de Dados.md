### **1. Criação de um Banco de Dados (`CREATE DATABASE`)**

Para criar um novo banco de dados no SGBD, utiliza-se o comando **CREATE DATABASE**[1].

- **Sintaxe básica**:

```
CREATE DATABASE nome_do_banco;

```

- **Uso da cláusula** **IF NOT EXISTS**: É uma boa prática adicionar a expressão `IF NOT EXISTS` antes do nome do banco[1]. Essa cláusula impede que o sistema exiba uma mensagem de erro caso você tente criar um banco de dados que já exista no servidor[1].

```
CREATE DATABASE IF NOT EXISTS nome_do_banco;

```

- **Exemplo prático do vídeo**: Durante a aula, é criado o banco de dados principal do curso, chamado **DB biblioteca**[1]:

```
CREATE DATABASE DB biblioteca;

```

---

### **2. Sensibilidade a Maiúsculas e Minúsculas (_Case Sensitivity_)**

Um ponto de atenção destacado no vídeo é que o comportamento dos nomes dos bancos de dados em relação a maiúsculas e minúsculas depende diretamente do **sistema operacional** em que o MySQL está rodando[2]:

- Em sistemas **Linux**, o sistema de arquivos diferencia maiúsculas de minúsculas (_case sensitive_)[2].
- Por isso, ao criar o banco como `DB biblioteca` (com o "B" maiúsculo no ambiente Linux), todas as referências futuras a esse banco de dados precisam manter exatamente a mesma grafia[2].

---

### **3. Seleção do Banco de Dados Ativo (`USE`)**

Como o servidor MySQL pode abrigar diversos bancos de dados simultaneamente, é necessário indicar explicitamente qual deles receberá as operações e tabelas subsequentes[3].

- **Sintaxe**:

```
USE nome_do_banco;

```

- **Exemplo**:

```
USE DB biblioteca;

```

- **Observação de sintaxe**: No comando `USE`, o ponto e vírgula (`;`) no final é tecnicamente opcional, porém o instrutor recomenda sempre utilizá-lo para manter a padronização dos comandos SQL[3].

---

### **4. Verificação do Banco Selecionado (`SELECT DATABASE()`)**

Caso haja dúvida sobre qual banco de dados está atualmente ativo na sessão, utiliza-se a função **SELECT DATABASE()**[3][4]:

```
SELECT DATABASE();

```

Ao executar este comando no MySQL Workbench, o painel de resultados retorna o nome do banco de dados em uso no momento (no caso da aula, `DB biblioteca`)[4][5].

---

### **5. Exclusão de um Banco de Dados (`DROP DATABASE`)**

Para remover um banco de dados existente e apagar toda a sua estrutura do servidor, utiliza-se a instrução **DROP DATABASE**[5].

- **Sintaxe básica**:

```
DROP DATABASE nome_do_banco;

```

- **Uso da cláusula** **IF EXISTS**: Assim como na criação, é possível utilizar a cláusula de proteção `IF EXISTS` para evitar que o servidor retorne um erro caso o banco informado não exista[5].

```
DROP DATABASE IF EXISTS nome_do_banco;

```

---

### **6. Verificação de Tabelas no Banco (`SHOW TABLES`)**

Para inspecionar quais tabelas existem dentro do banco de dados atualmente selecionado, utiliza-se o comando **SHOW TABLES**[6].

Quando executado no banco `DB biblioteca` logo após a sua criação, o comando retorna um resultado em branco, confirmando que a estrutura foi criada com sucesso, mas ainda não possui nenhuma tabela cadastrada[6].
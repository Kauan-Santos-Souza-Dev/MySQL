### **1. O Comando `DELETE FROM` (Exclusão Selecionada de Registros)**

O comando **DELETE** é uma instrução DML utilizada para excluir uma ou mais linhas (registros) específicas de uma tabela[1][3].

- **Sintaxe básica**:

``` sql
DELETE FROM nome_da_tabela
WHERE coluna = valor;

```

_(Exemplo do vídeo:_ _DELETE FROM tbl_teste_incremento WHERE codigo = 90;_ _para remover o registro de código 90)_[1][4]_._

- **Escopo de Exclusão**: Quando a instrução `DELETE` é executada, o MySQL não apaga apenas o conteúdo de um campo individual, mas elimina **a linha inteira** do banco de dados[1].
- **A Importância Crucial da Cláusula** **WHERE**:
    - É fundamental sempre incluir a cláusula `WHERE` para especificar exatamente qual linha deve ser removida[1][5].
    - Se a instrução `DELETE FROM nome_tabela;` for executada **sem a cláusula** **WHERE**, o MySQL excluirá **todos os registros** da tabela, apagando linha por linha sequencialmente, o que pode ser um processo demorado em tabelas muito grandes[5][6].
- **Comportamento do Auto Incremento**: A exclusão via `DELETE` **não zera** o valor do `AUTO_INCREMENT`[7]. Se o último registro de código 90 for apagado, o próximo registro inserido continuará a sequência a partir de 91[7][8].

---

### **2. O Comando `TRUNCATE TABLE` (Limpeza e Redefinição da Tabela)**

Quando o objetivo é apagar **todos** os registros de uma tabela de uma só vez, o comando recomendado é o **TRUNCATE TABLE**[2][7].

- **Sintaxe básica**:

```
TRUNCATE TABLE nome_da_tabela;

```

_(Exemplo do vídeo:_ _TRUNCATE TABLE tbl_teste_incremento;_ _)_[9][10]_._

- **Alta Performance e Nível de Atuação**: Em vez de passar registro por registro apagando linha a linha (como faz o `DELETE`), o `TRUNCATE` opera diretamente em nível de tabela[6]. Ele redefine a tabela e descarta todo o seu conteúdo de forma quase instantânea, consumindo significativamente menos recursos do sistema e do log de transações[2][6].
- **Sem Filtros**: O `TRUNCATE TABLE` não aceita a cláusula `WHERE` ou filtros condicionais[7].
- **Redefinição do Auto Incremento**: Ao executar o `TRUNCATE`, o contador do `AUTO_INCREMENT` é completamente resetado para o seu valor inicial padrão[7].
- **Manutenção da Estrutura**: Tanto o `DELETE` quanto o `TRUNCATE` apagam apenas os **dados** gravados[9]. A tabela propriamente dita continua existindo intacta no banco de dados com todas as suas colunas e restrições, pronta para receber novos registros[9][11].

---

### **3. Comparativo: `DELETE` vs. `TRUNCATE` vs. `DROP`**

Para entender o impacto de cada comando de exclusão no MySQL, pode-se analisar a progressão dos níveis de ação[3][12]:

|Característica|`DELETE FROM`|`TRUNCATE TABLE`|`DROP TABLE`|
|---|---|---|---|
|**Nível de Atuação**|Linhas/Registros individuais[1][3]|Tabela completa (Dados)[2][11]|Objeto / Esquema (Estrutura e Dados)[3][13]|
|**Uso da Cláusula** **WHERE**|Permitido (e indispensável)[1][5]|Não permitido[7]|Não se aplica[13]|
|**Impacto no** **AUTO_INCREMENT**|Mantém a sequência atual[7]|Reseta para o valor inicial[7]|Exclui a coluna e a tabela inteira[13]|
|**Velocidade / Performance**|Mais lenta em grandes volumes[5][6]|Muito rápida (instantânea)[6]|Instantânea[12]|
|**Estado Final da Tabela**|Tabela existe (com menos linhas ou vazia)[9]|Tabela existe totalmente limpa[9][11]|Tabela deixa de existir no banco[13][14]|

---

### **4. Cuidados com a Integridade Referencial**

Em bancos de dados relacionais, caso existam tabelas conectadas por Chaves Estrangeiras (`FOREIGN KEY`), o MySQL pode impedir a execução do `DELETE` ou do `TRUNCATE` se houver registros vinculados em outras tabelas filhas[10][15]. Nesses casos, é necessário remover primeiro os registros dependentes na tabela filho antes de excluir o registro na tabela pai[15].


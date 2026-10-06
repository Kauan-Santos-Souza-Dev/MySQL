
---

### 1. O que é o Auto Incremento (`AUTO_INCREMENT`)?

- **Definição**: O `AUTO_INCREMENT` é uma restrição (_constraint_) / atributo que permite a geração automática de um número único e sequencial cada vez que um novo registro é inserido em uma tabela.
- **Comportamento Padrão**: Por padrão, o valor inicial do auto incremento é **1** e ele é incrementado de **1 em 1** a cada nova inserção.
- **Regras Principais**:
    - É permitido **apenas um** campo com `AUTO_INCREMENT` por tabela.
    - Geralmente é aplicado a colunas de tipo numérico inteiro (como `INT` ou `SMALLINT`) e associado à restrição `PRIMARY KEY` (ou a um índice).
    - O campo não pode receber valores nulos (`NOT NULL`), já que o próprio sistema se encarrega de preenchê-lo automaticamente.

---

### 2. Definição do Auto Incremento na Criação da Tabela

Para aplicar o recurso, adiciona-se a palavra-chave `AUTO_INCREMENT` junto à definição da coluna. Além disso, é possível definir um valor inicial diferente de 1 adicionando a cláusula `AUTO_INCREMENT = valor` ao final da declaração `CREATE TABLE`.

#### Exemplo Prático do Vídeo:

```
CREATE TABLE tbl_teste_incremento (
    codigo SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL
) AUTO_INCREMENT = 15;
```

- **Explicação**: A coluna `codigo` é uma chave primária com incremento automático. A cláusula `AUTO_INCREMENT = 15` força o MySQL a iniciar a contagem a partir do número 15, em vez do valor padrão 1.

---

### 3. Inserção de Dados (`INSERT INTO`)

Ao inserir novos registros em uma tabela que possui uma coluna `AUTO_INCREMENT`, **não é necessário especificar essa coluna** na lista de campos do comando `INSERT`.

```
INSERT INTO tbl_teste_incremento (nome) VALUES ('Ana');
INSERT INTO tbl_teste_incremento (nome) VALUES ('Maria');
INSERT INTO tbl_teste_incremento (nome) VALUES ('Júlia');
INSERT INTO tbl_teste_incremento (nome) VALUES ('Joana');
```

Ao consultar os dados com `SELECT * FROM tbl_teste_incremento;`, o resultado gerado automaticamente pelo banco é:

- `15` — Ana
- `16` — Maria
- `17` — Júlia
- `18` — Joana

---

### 4. Como Verificar o Valor Atual/Último Gerado

Para consultar qual foi o maior número sequencial gerado até o momento na coluna de auto incremento, utiliza-se a função de agregação `MAX()`:

```
SELECT MAX(codigo) FROM tbl_teste_incremento;
```

- **Resultado**: Retorna o valor `18`, indicando que o próximo registro a ser inserido receberá naturalmente o número `19`.

---

### 5. Alterando o Próximo Valor do Auto Incremento (`ALTER TABLE`)

Caso haja necessidade de saltar a sequência para um valor mais alto no meio da utilização da tabela, pode-se redefinir o próximo valor com o comando `ALTER TABLE`:

#### Comando de Alteração:

```
ALTER TABLE tbl_teste_incremento AUTO_INCREMENT = 90;
```

- **Efeito**: Os registros anteriores permanecem inalterados, mas os próximos registros inseridos passarão a contar a partir de 90.

#### Teste com Novos Inserts:

```
INSERT INTO tbl_teste_incremento (nome) VALUES ('Renata');
INSERT INTO tbl_teste_incremento (nome) VALUES ('Jorge');
INSERT INTO tbl_teste_incremento (nome) VALUES ('Fábio');
INSERT INTO tbl_teste_incremento (nome) VALUES ('Sandra');
```

Ao realizar um novo `SELECT * FROM tbl_teste_incremento;`, a sequência fica assim:

- `15` — Ana
- `16` — Maria
- `17` — Júlia
- `18` — Joana
- `90` — Renata
- `91` — Jorge
- `92` — Fábio
- `93` — Sandra

---

💡 Deseja prosseguir para a aula 09 sobre os **Tipos de Dados comuns** ou aprender sobre comandos de manipulação de dados como o `INSERT INTO` (aula 11) e `SELECT` (aula 12)?
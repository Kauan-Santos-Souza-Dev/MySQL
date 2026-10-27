No MySQL, para alterar o nome de uma tabela já existente sem perder seus dados nem precisar recriá-la, utiliza-se o comando **`RENAME TABLE`**.

---

### 1. Sintaxe Geral com `RENAME TABLE`

A estrutura básica do comando é bastante simples:

```
RENAME TABLE nome_tabela_atual TO novo_nome_tabela;
```

#### Exemplo Prático

Caso você tenha criado uma tabela chamada `clientes` e deseje alterá-la para `meus_clientes`, execute:

```
RENAME TABLE clientes TO meus_clientes;
```

Após a execução do comando, qualquer consulta direcionada ao nome antigo deixará de funcionar, devendo ser utilizada a nova nomenclatura.

---

### 2. Sintaxe Alternativa com `ALTER TABLE`

Também é possível renomear uma tabela utilizando o comando **`ALTER TABLE`** combinado com a cláusula `RENAME TO`:

```
ALTER TABLE clientes RENAME TO meus_clientes;
```

---

### 3. Cuidados e Boas Práticas

- **Preservação de Dados**: O comando altera apenas a referência do nome no catálogo do banco de dados, mantendo intactos todos os registros e colunas gravados na tabela.
- **Impacto em Relacionamentos e Código**: Renomear tabelas vinculadas por Chaves Estrangeiras (`FOREIGN KEY`), ou que sejam referenciadas em _Views_, _Stored Procedures_ e aplicações externas, exige atenção e atualização das referências para evitar falhas de execução.
- **Backup**: É altamente recomendado realizar um **backup** do banco de dados antes de executar alterações estruturais no ambiente de produção.

---


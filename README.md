 Sistema de Gestão de um Campeonato de Futebol Amador ("Taça Interbairros")

Este repositório contém os scripts SQL para a implementação e manipulação (DML) do banco de dados relacional, baseado em um Modelo Lógico normalizado até a 3ª Forma Normal (3FN).

 Modelo e Normalização

O projeto foi modelado para gerenciar times, jogadores, agendamento de partidas e eventos (gols, cartões), garantindo a integridade dos dados e eliminando redundâncias.

* **Modelo Lógico:** Possui 7 entidades, incluindo a entidade associativa `EVENTO_PARTIDA` (Chave Composta) e a representação do relacionamento reflexivo para a `PARTIDA` (Time Casa e Time Visitante).

Instruções de Execução (MySQL/MariaDB)

Para replicar o ambiente do projeto e validar a integridade dos dados, execute os scripts em um ambiente de SGBD na seguinte ordem:

1.  **`01_schema_creation.sql`**: **Criação do Schema (DDL)**. Cria todas as 7 tabelas e define as chaves primárias e estrangeiras com as restrições `ON DELETE RESTRICT` e `ON UPDATE CASCADE`.
2.  **`02_data_manipulation_dml.sql`**: **Povoamento e Consultas**. Insere os dados de teste em todas as tabelas e executa as consultas (SELECT) para gerar os relatórios.
3.  **`03_update_delete_dml.sql`**: **Manipulação Avançada (UPDATE/DELETE)**. Testa a integridade dos dados, atualiza status de jogadores e remove eventos/partidas.

Análise das Consultas (SELECT)

O script `02_data_manipulation_dml.sql` demonstra a funcionalidade do sistema:

* **Consulta 1 (Artilharia):** Utiliza `JOIN` em múltiplas tabelas e `GROUP BY` para calcular o total de gols por jogador.
* **Consulta 2 (Próximos Jogos):** Utiliza múltiplos `JOIN`s para trazer os nomes dos times (via relacionamento reflexivo), estádio e árbitro.
* **Consulta 3 (Controle Disciplinar):** Demonstra a aplicação de `WHERE` para filtrar jogadores com status de suspensão ativo.

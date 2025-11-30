– SCRIPT 03: MANIPULAÇÃO AVANÇADA (UPDATE e DELETE)

– =================================== – A. COMANDOS UPDATE (Três ou
mais) – ===================================

– UPDATE 1: Suspender o jogador Marcos Souza (Matrícula 200) – Objetivo:
Atualizar o status booleano UPDATE JOGADOR SET Jog_Status_Suspensao =
TRUE WHERE Jog_Matricula = 200;

– UPDATE 2: Corrigir o placar de uma partida – Objetivo: Corrigir o
resultado da Partida 1 para 3x2. UPDATE PARTIDA SET
Part_Placar_Visitante = 2 WHERE Part_ID = 1;

– UPDATE 3: Mudar a data e hora de uma partida (adiamento) – Objetivo:
Alterar a data da Partida 2. UPDATE PARTIDA SET Part_Data =
‘2025-10-15’, Part_Hora = ‘19:00:00’ WHERE Part_ID = 2;

– =================================== – B. COMANDOS DELETE (Três ou
mais) – ===================================

– DELETE 1: Remover um evento de jogo (ex: gol anulado) – Objetivo:
Remover o último gol de Lucas Lima (Evento 3 da Partida 1). DELETE FROM
EVENTO_PARTIDA WHERE Part_ID = 1 AND Event_Minuto = 70 AND Jog_Matricula
= 100;

– DELETE 2: Remover uma PARTIDA (Partida 2) – Objetivo: Remoção de uma
partida inteira. A tabela EVENTO_PARTIDA não é afetada pois a Partida 2
não tem eventos. DELETE FROM PARTIDA WHERE Part_ID = 2;

– DELETE 3: Remover um Árbitro – Objetivo: Remover um árbitro que não
está mais ligado a nenhuma partida após o DELETE 2. – OBSERVAÇÃO: A
restrição ON DELETE RESTRICT impede a remoção se o árbitro estiver
associado a outras partidas. DELETE FROM ARBITRO WHERE Arb_Nome = ‘Maria
Santos’;

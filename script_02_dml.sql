-- SCRIPT 02: MANIPULAÇÃO DE DADOS (INSERT e SELECT)

-- ===================================
-- A. COMANDOS INSERT (POVOAMENTO)
-- ===================================

-- 1. CAMPEONATO
INSERT INTO CAMPEONATO (Camp_Nome, Camp_Ano, Camp_Formato) VALUES
('Taça Interbairros 2025', 2025, 'Pontos Corridos');

-- 2. ESTADIO
INSERT INTO ESTADIO (Est_Nome, Est_Endereco, Est_Capacidade) VALUES
('Arena Mauá', 'Rua Principal, 100', 5000),
('Campo do Centro', 'Av. Central, 50', 3000);

-- 3. ARBITRO
INSERT INTO ARBITRO (Arb_Nome, Arb_Contato) VALUES
('João Silva', '99111-2222'),
('Maria Santos', '99333-4444');

-- 4. TIME (Assumindo Camp_ID = 1)
INSERT INTO TIME (Camp_ID, Time_Nome, Time_Cores, Time_Tecnico) VALUES
(1, 'Os Invencíveis', 'Azul/Branco', 'Carlos Pena'),
(1, 'Dragões do Bairro', 'Vermelho/Preto', 'Ana Costa'),
(1, 'União FC', 'Verde/Amarelo', 'Ricardo Alves');

-- 5. JOGADOR
INSERT INTO JOGADOR (Jog_Matricula, Time_ID, Jog_Nome, Jog_Posicao, Jog_Dt_Nascimento, Jog_Status_Suspensao) VALUES
(100, 1, 'Lucas Lima', 'Atacante', '2000-05-15', FALSE),
(101, 1, 'Pedro Rocha', 'Zagueiro', '1998-01-20', FALSE),
(200, 2, 'Marcos Souza', 'Meio-Campo', '1995-11-01', FALSE),
(300, 3, 'Gabriel Neves', 'Goleiro', '2003-08-10', TRUE);

-- 6. PARTIDA
INSERT INTO PARTIDA (Est_ID, Arb_ID, Time_Casa_ID, Time_Visitante_ID, Part_Data, Part_Hora, Part_Placar_Casa, Part_Placar_Visitante) VALUES
(1, 1, 1, 2, '2025-10-05', '15:00:00', 3, 1),
(2, 2, 3, 1, '2025-10-12', '10:00:00', 0, 0);

-- 7. EVENTO_PARTIDA
INSERT INTO EVENTO_PARTIDA (Part_ID, Jog_Matricula, Event_Tipo, Event_Minuto) VALUES
(1, 100, 'GOL', 25),
(1, 100, 'GOL', 50),
(1, 100, 'GOL', 70);

INSERT INTO EVENTO_PARTIDA (Part_ID, Jog_Matricula, Event_Tipo, Event_Minuto) VALUES
(1, 200, 'CA', 40);

-- ===================================
-- B. COMANDOS SELECT (CONSULTAS)
-- ===================================

-- Consulta 1: Artilharia
SELECT
    J.Jog_Nome,
    T.Time_Nome,
    COUNT(E.Event_Tipo) AS Total_Gols
FROM
    JOGADOR J
JOIN
    TIME T ON J.Time_ID = T.Time_ID
JOIN
    EVENTO_PARTIDA E ON J.Jog_Matricula = E.Jog_Matricula
WHERE
    E.Event_Tipo = 'GOL'
GROUP BY
    J.Jog_Nome, T.Time_Nome
ORDER BY
    Total_Gols DESC;

-- Consulta 2: Próximo Jogo
SELECT
    P.Part_Data,
    TC.Time_Nome AS Time_Casa,
    TV.Time_Nome AS Time_Visitante,
    A.Arb_Nome AS Arbitro,
    E.Est_Nome AS Estadio
FROM
    PARTIDA P
JOIN
    TIME TC ON P.Time_Casa_ID = TC.Time_ID
JOIN
    TIME TV ON P.Time_Visitante_ID = TV.Time_ID
JOIN
    ARBITRO A ON P.Arb_ID = A.Arb_ID
JOIN
    ESTADIO E ON P.Est_ID = E.Est_ID
WHERE
    P.Part_Data >= CURDATE()
ORDER BY
    P.Part_Data ASC
LIMIT 1;

-- Consulta 3: Jogadores Suspensos
SELECT
    Jog_Nome,
    T.Time_Nome,
    Jog_Status_Suspensao
FROM
    JOGADOR J
JOIN
    TIME T ON J.Time_ID = T.Time_ID
WHERE
    J.Jog_Status_Suspensao = TRUE;

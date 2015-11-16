SELECT
    conta.CON_NOME AS Conta,
	(aliancaconta.ALC_ENTRADA - aliancaconta.ALC_SAIDA) AS Perda,
    funcionario.FUN_NOME AS Funcionario,
    maquina.MAQ_NOME AS Maquina,
    alianca.OS_ID as OS
FROM
    tbl_alianca_conta AS aliancaconta
INNER JOIN
    tbl_conta AS conta
ON
	aliancaconta.CON_ID = conta.CON_ID
INNER JOIN
    tbl_funcionario AS funcionario
ON
	aliancaconta.FUN_ID = funcionario.FUN_ID
INNER JOIN
    tbl_maquina AS maquina
ON
    aliancaconta.MAQ_ID = maquina.MAQ_ID
LEFT JOIN
	(SELECT * FROM tbl_alianca WHERE ALI_ATIVADO = 1) AS alianca
ON
    aliancaconta.ALI_ID = alianca.ALI_ID
WHERE
    ALC_ATIVADO = 1
    AND CON_ATIVADO = 1
    AND FUN_ATIVADO = 1
    AND MAQ_ATIVADO = 1
ORDER BY conta.CON_ID
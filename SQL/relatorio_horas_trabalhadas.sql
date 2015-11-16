SELECT
	conta.CON_NOME AS Conta,
	TIMESTAMPDIFF(MINUTE,aliancaconta.ALC_INICIO, ifnull( aliancaconta.ALC_TERMINO, now()) ) AS HorasTrabalhadas,
    funcionario.FUN_NOME AS Funcionario,
    os.OS_ID AS OS
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
	tbl_alianca AS alianca
ON
	aliancaconta.ALI_ID = alianca.ALI_ID
INNER JOIN
	tbl_os AS os
ON
	alianca.OS_ID = os.OS_ID
WHERE
	ALC_ATIVADO = 1
    AND CON_ATIVADO = 1
    AND OS_ATIVADO = 1
    and cast(aliancaconta.ALC_INICIO as Date)  between ?DataInicial and ?DataFinal )
ORDER BY conta.CON_NOME
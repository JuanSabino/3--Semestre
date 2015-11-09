SELECT 
	os.os_id AS OrderServico
    , os.OS_LOJA AS Loja
    , alianca.ali_id AS Alianca
    , modelo.MOD_Nome AS Modelo
    , alianca.ALI_TAMANHO AS Tamanho
    , modelo.MOD_PESO AS Peso
    , alianca.ALI_DETALHES AS Detalhes 
    , os.OS_DATAENTRADA AS DataAbertura
    , ifnull( os.OS_DATASAIDA, now()) AS DataEncerramento
    , TIMESTAMPDIFF(DAY,os.OS_DATAENTRADA, ifnull( os.OS_DATASAIDA, now()) ) AS DiasAbertos
FROM
	tbl_os AS os
INNER JOIN
	tbl_alianca AS alianca
ON 
	os.os_id=alianca.os_id
INNER JOIN
	tbl_modelo AS modelo
ON 
	alianca.mod_id=modelo.mod_id
WHERE
	alianca.ALI_ATIVADO = 1
    AND modelo.MOD_ATIVADO = 1
    AND os.OS_ATIVADO = 1
    AND os.OS_DATASAIDA IS NOT NULL
ORDER BY DiasAbertos ASC
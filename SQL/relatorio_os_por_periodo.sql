select 
	os.os_id as OrderServico
    , os.OS_LOJA as Loja
    , alianca.ali_id as Alianca
    , modelo.MOD_Nome as Modelo
    , alianca.ALI_TAMANHO as Tamanho
    , modelo.MOD_PESO as Peso
    , alianca.ALI_DETALHES as Detalhes 
    , os.OS_DATAENTRADA as DataAbertura
    , os.OS_DATASAIDA as DataEncerramento
    
from 
	tbl_os as os
inner join 
	tbl_alianca as alianca
on 
	os.os_id=alianca.os_id
inner join 
	tbl_modelo as modelo
on 
	alianca.mod_id=modelo.mod_id
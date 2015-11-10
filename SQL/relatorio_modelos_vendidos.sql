select MOD_NOME  as Modelo
	, ( select 
			count(alianca.mod_id) 
		from 
			tbl_alianca as alianca 
		inner join 
			tbl_os as os 
        on 
			os.os_id=alianca.os_id 
        where alianca.mod_id = modelo.mod_id 
			and alianca.ALI_ATIVADO = 1 
            and os.OS_ATIVADO = 1) as Quantidade

from tbl_modelo as modelo
where MOD_ATIVADO = 1
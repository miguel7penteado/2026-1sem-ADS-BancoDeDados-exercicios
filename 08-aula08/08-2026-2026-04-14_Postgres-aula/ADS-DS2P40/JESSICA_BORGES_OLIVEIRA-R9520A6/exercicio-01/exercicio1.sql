SELECT 
	cnpj, status, nome, 
	data_atividade, estado
INTO
    yeda_gomes_dos_santos_custodio_r872696.relatorio01
FROM 
	public.cnpj_brasil
where 
	estado = 'AC' AND
	cast(data_atividade as DATE) > '2024-01-01' limit 2000;

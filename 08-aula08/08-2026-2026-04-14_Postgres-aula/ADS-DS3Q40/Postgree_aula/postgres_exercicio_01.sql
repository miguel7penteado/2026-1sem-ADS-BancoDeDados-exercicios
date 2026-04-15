SELECT cnpj, status, nome, data_atividade, estado, razao_social
INTO
	yeda_gomes_dos_santos_custodio_r872696.relatorio01
FROM public.cnpj_brasil;
WHERE
	estado = 'AC' AND
	CAST(data_atividade AS DATE)> '2024-01-01' limit 2000

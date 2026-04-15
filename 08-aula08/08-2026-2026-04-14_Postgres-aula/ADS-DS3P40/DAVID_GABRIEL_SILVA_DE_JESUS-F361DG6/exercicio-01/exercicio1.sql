//exercicio1
select
cnpj,
razao_social,
nome,
data_atividade,
estado,
cidade
into 
david_gabriel_silva_de_jesus_f361dg6.relatorio01
from public.cnpj_brasil 
where estado='SP'and
cast(data_atividade as date)> '2024-01-01'
limit 2000;

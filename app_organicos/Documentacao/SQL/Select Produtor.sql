SELECT 
id, 
certificadora_id, 
grupo_id, 
nome, 
nome_propriedade, 
cpf_cnpj, 
endereco, 
numero, 
bairro, 
cidade_id, 
telefone, 
latitude, 
longitude, 
certificacao_organicos, 
venda_consumidorfinal, 
registro_ativo 
FROM PRODUTOR
WHERE registro_ativo 
AND
LOWER(
CONCAT(
coalesce(nome,''),        
coalesce(nome_propriedade,''),           
coalesce(cpf_cnpj,''),               
coalesce(endereco,''),         
coalesce(bairro,'')
)
)
LIKE '%%'
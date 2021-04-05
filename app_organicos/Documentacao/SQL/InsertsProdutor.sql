SELECT * FROM public.certificadora;	
SELECT * FROM public.produto;
SELECT * FROM public.grupo;
SELECT * FROM public.produtor;

-- ref.: https://www.gov.br/agricultura/pt-br/assuntos/sustentabilidade/organicos/arquivos-organicos/copy6_of_ENDEREOSDECERTIFICADORASEOPAC.pdf
INSERT INTO certificadora(id,nome, registro_ativo)	VALUES (1,'IBD', 1);
INSERT INTO certificadora(id,nome, registro_ativo)	VALUES (2,'EcoSocial', 1);
INSERT INTO certificadora(id,nome, registro_ativo)	VALUES (3,'Demeter', 1);
INSERT INTO certificadora(id,nome, registro_ativo)	VALUES (4,'Abio', 1);
INSERT INTO certificadora(id,nome, registro_ativo)	VALUES (5,'Ecocert ', 1);
INSERT INTO certificadora(id,nome, registro_ativo)	VALUES (6,'OIA ', 1);

-- ref> : https://www.google.com/search?q=cooperativa%20de%20org%C3%A2nicos&oq=cooperativa+de+organiicos&aqs=chrome..69i57j0i13j0i8i13i30l5.10551j0j4&sourceid=chrome&ie=UTF-8&tbs=lf:1,lf_ui:2&tbm=lcl&sxsrf=ALeKk00yU1pk6F4vkYCg6oUpq5N0pQLRsw:1615340868434&rflfq=1&num=10&rldimm=13012094996036429195&lqi=Chljb29wZXJhdGl2YSBkZSBvcmfDom5pY29zWjYKGWNvb3BlcmF0aXZhIGRlIG9yZ8Oibmljb3MiGWNvb3BlcmF0aXZhIGRlIG9yZ8Oibmljb3OSAQ1mb29kX3Byb2R1Y2VyqgEhEAEqHSIZY29vcGVyYXRpdmEgZGUgb3Jnw6JuaWNvcygM&ved=2ahUKEwjTv53VzaTvAhUiD7kGHdGEAKsQvS4wAHoECAgQLg&rlst=f#rlfi=hd:;si:13012094996036429195,l,Chljb29wZXJhdGl2YSBkZSBvcmfDom5pY29zWjYKGWNvb3BlcmF0aXZhIGRlIG9yZ8Oibmljb3MiGWNvb3BlcmF0aXZhIGRlIG9yZ8Oibmljb3OSAQ1mb29kX3Byb2R1Y2VyqgEhEAEqHSIZY29vcGVyYXRpdmEgZGUgb3Jnw6JuaWNvcygM;mv:[[-19.61244,-48.3057808],[-35.4331244,-59.031590699999995]];tbs:lrf:!1m4!1u3!2m2!3m1!1e1!1m4!1u2!2m2!2m1!1e1!2m1!1e2!2m1!1e3,lf:1,lf_ui:2
INSERT INTO grupo(nome, endereco, numero, bairro, cidade_id, cnpj, inscricao_estadual, distribuidor_produtos, registro_ativo) VALUES ('Cores da Terra', 'R. Maringá - Sala 1', '1968', 'Bairro São Cristóvão',3256, '32817675000114', 'IE-1597533', true, true);
INSERT INTO grupo(nome, endereco, numero, bairro, cidade_id, cnpj, inscricao_estadual, distribuidor_produtos, registro_ativo) VALUES ('Green Plant', 'R. Santa Cruz - Sala 23', '1578', 'Bairro Centro',2566, '32817675000114', 'IE-1597533', true, true);

INSERT INTO public.produtor(
	certificadora_id, grupo_id, nome, nome_propriedade, cpf_cnpj, endereco, numero, bairro, cidade_id, telefone, latitude, longitude, certificacao_organicos, venda_consumidorfinal, registro_ativo)
	VALUES (1, 1, 'Olaides Ferreira', 'Sitio Lua nova', '461.096.560-70', 'Endereco', '159','Bairro','3566','45-99904578','154654', '564654', 'A',true, true);
	
-- consulta produtor: 
SELECT id, certificadora_id, grupo_id, nome, nome_propriedade, cpf_cnpj, endereco, numero,  
bairro, cidade_id, telefone, latitude, longitude, certificacao_organicos, venda_consumidorfinal, registro_ativo 
FROM PRODUTOR WHERE registro_ativo = true
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
LIMIT 50;

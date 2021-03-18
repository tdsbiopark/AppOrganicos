import 'package:app_organicos/modelo/certificadora.dart';
import 'package:app_organicos/modelo/cidade.dart';
import 'package:app_organicos/modelo/grupo.dart';
import 'package:app_organicos/modelo/produtor.dart';

import 'conexao.dart';
import 'package:postgres/postgres.dart';

class ProdutorDao {
//Metodo gravar:
  Future<void> gravar(Produtor produtor) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();

    //Abre bloco de transação:
    await conexao.transaction((contexto) async {
      //Valida se esta atualizando ou inserindo:
      if (produtor.id == null || produtor.id == 0) {
        //Query do insert:
        await contexto.query("""INSERT INTO PRODUTOR (
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
          registro_ativo) 
          VALUES (
            @Certificadora_id, 
            @Grupo_id, 
            @Nome, 
            @Nome_propriedade, 
            @Cpf_cnpj, 
            @Endereco, 
            @Numero, 
            @Bairro, 
            @Cidade_id, 
            @Telefone, 
            @Latitude, 
            @Longitude, 
            @Certificacao_organicos, 
            @Venda_consumidorfinal, 
            @Registro_ativo)""", substitutionValues: {
          "id": produtor.id,
          "certificadora_id": produtor.certificadora.id,
          "grupo_id": produtor.grupo.id,
          "nome": produtor.nome,
          "nome_propriedade": produtor.nomePropriedade,
          "cpf_cnpj": produtor.cpfCnpj,
          "endereco": produtor.endereco,
          "numero": produtor.numero,
          "bairro": produtor.bairro,
          "cidade_id": produtor.cidade.id,
          "telefone": produtor.telefone,
          "latitude": produtor.latitude,
          "longitude": produtor.longitude,
          "certificacao_organicos": produtor.certificacaoOrganicos,
          "venda_consumidorfinal": produtor.vendaConsumidorFinal,
          "registro_ativo": produtor.ativo,
        });
      } else {
        await contexto.query("""UPDATE PRODUTOR SET 
        certificadora_id = @Certificadora_id, 
        grupo_id = @Grupo_id, 
        nome = @Nome, 
        nome_propriedade = @Nome_propriedade, 
        cpf_cnpj = @Cpf_cnpj, 
        endereco = @Endereco, 
        numero = @Numero, 
        bairro = @Bairro, 
        cidade_id = @Cidade_id, 
        telefone = @Telefone, 
        latitude = @Latitude, 
        longitude = @Longitude, 
        certificacao_organicos = @Certificacao_organicos, 
        venda_consumidorfinal = @Venda_consumidorfinal, 
        registro_ativo = @Registro_ativo
          WHERE id = @Id""", substitutionValues: {
          "id": produtor.id,
          "certificadora_id": produtor.certificadora.id,
          "grupo_id": produtor.grupo.id,
          "nome": produtor.nome,
          "nome_propriedade": produtor.nomePropriedade,
          "cpf_cnpj": produtor.cpfCnpj,
          "endereco": produtor.endereco,
          "numero": produtor.numero,
          "bairro": produtor.bairro,
          "cidade_id": produtor.cidade.id,
          "telefone": produtor.telefone,
          "latitude": produtor.latitude,
          "longitude": produtor.longitude,
          "certificacao_organicos": produtor.certificacaoOrganicos,
          "venda_consumidorfinal": produtor.vendaConsumidorFinal,
          "registro_ativo": produtor.ativo,
        });
      }
    });
  }

//Metodo pesquisar:
  Future<List<Produtor>> pesquisar(String filtro) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    //Instancia a lista vazia:
    List<Produtor> produtores = List.empty(growable: true);

    //Faz a consulta
    List<Map<String, Map<String, dynamic>>> results =
        await conexao.mappedResultsQuery("""
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
              FROM 
                PRODUTOR
              WHERE 
                registro_ativo 
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
              LIKE @filtro
              LIMIT 50""",
            //Aplica uma filtro na consulta:
            substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    //Preenche a lista de produtos:
    for (final row in results) {
      Produtor produtor = Produtor();
      produtor.id = row["produtor"]["id"];
      produtor.certificadora = Certificadora()
        ..id = row["produtor"]["certificadora_id"];
      produtor.grupo = Grupo()..id = row["produtor"]["grupo_id"];
      produtor.nome = row["produtor"]["nome"];
      produtor.nomePropriedade = row["produtor"]["nomePropriedade"];
      produtor.cpfCnpj = row["produtor"]["cpfCnpj"];
      produtor.endereco = row["produtor"]["endereco"];
      produtor.numero = row["produtor"]["numero"];
      produtor.bairro = row["produtor"]["bairro"];
      produtor.cidade = Cidade()..id = row["produtor"]["cidade"];
      produtor.telefone = row["produtor"]["telefone"];
      produtor.latitude = row["produtor"]["latitude"];
      produtor.longitude = row["produtor"]["longitude"];
      produtor.certificacaoOrganicos =
          row["produtor"]["certificacao_organicos"];
      produtor.vendaConsumidorFinal = row["produtor"]["venda_consumidorfinal"];
      produtor.ativo = row["produtor"]["registro_ativo"];
    }
    return produtores;
  }
}

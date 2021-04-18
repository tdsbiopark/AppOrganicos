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
            @certificadora_id, 
            @grupo_id, 
            @nome, 
            @nome_propriedade, 
            @cpf_cnpj, 
            @endereco, 
            @numero, 
            @bairro, 
            @cidade_id, 
            @telefone, 
            @latitude, 
            @longitude, 
            @certificacao_organicos, 
            @venda_consumidorfinal, 
            @registro_ativo)""", substitutionValues: {
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
        certificadora_id = @certificadora_id, 
        grupo_id = @grupo_id, 
        nome = @nome, 
        nome_propriedade = @nome_propriedade, 
        cpf_cnpj = @cpf_cnpj, 
        endereco = @endereco, 
        numero = @numero, 
        bairro = @bairro, 
        cidade_id = @cidade_id, 
        telefone = @telefone, 
        latitude = @latitude, 
        longitude = @longitude, 
        certificacao_organicos = @certificacao_organicos, 
        venda_consumidorfinal = @venda_consumidorfinal, 
        registro_ativo = @registro_ativo
          WHERE id = @id""", substitutionValues: {
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
          LIKE @filtro
          LIMIT 50""",
            //Aplica uma filtro na consulta:
            substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    //Preenche a lista de produtos:
    for (final row in results) {
      Produtor produtor = Produtor();
      produtor.id = row["produtor"]["id"];
      produtor.nome = row["produtor"]["nome"];
      produtor.nomePropriedade = row["produtor"]["nome_propriedade"];
      produtor.cpfCnpj = row["produtor"]["cpf_cnpj"];
      produtor.endereco = row["produtor"]["endereco"];
      produtor.numero = row["produtor"]["numero"];
      produtor.bairro = row["produtor"]["bairro"];
      produtor.telefone = row["produtor"]["telefone"];
      produtor.latitude = row["produtor"]["latitude"];
      produtor.longitude = row["produtor"]["longitude"];
      produtor.certificacaoOrganicos =
          row["produtor"]["certificacao_organicos"];
      produtor.vendaConsumidorFinal = row["produtor"]["venda_consumidorfinal"];
      produtor.ativo = row["produtor"]["registro_ativo"];
      produtor.cidade = Cidade()..id = row["produtor"]["cidade_id"];
      produtor.grupo = Grupo()..id = row["produtor"]["grupo_id"];
      produtor.certificadora = Certificadora()
        ..id = row["produtor"]["certificadora_id"];
      //add obj na lista:
      produtores.add(produtor);
    }
    return produtores;
  }
}

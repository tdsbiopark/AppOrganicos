import 'dart:js';

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

}

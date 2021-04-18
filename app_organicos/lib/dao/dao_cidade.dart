import 'package:app_organicos/modelo/cidade.dart';
import 'package:app_organicos/modelo/estado.dart';
import 'package:flutter/animation.dart';
import 'package:postgres/postgres.dart';
import '../modelo/cidade.dart';
import 'conexao.dart';

class CidadeDAO {
  //Retorna uma lista futura: Recebe um texto para pesquisar
  Future<List<Cidade>> pesquisar(String filtro) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();

    //retorna uma lista: Flutter 2.0 - Cria a lista fazia
    //Cidade cidade = new Cidade();

    //retorna uma lista: Flutter 2.0 - Cria a lista fazia
    List<Cidade> cidades = List.empty(growable: true);
    //Faz a consulta
    List<Map<String, Map<String, dynamic>>> results = await conexao
        .mappedResultsQuery("""SELECT id, nome, estado_id from cidade 
           where lower(nome) like @filtro limit 50""",
            //Aplica uma filtro na consulta:
            substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    //Preenche a lista:
    for (final row in results) {
      Cidade cidade = Cidade();
      cidade.id = row["cidade"]["id"];
      //Relacionamento FK : os dois pontos retorna o objeto e com o ID retornado
      cidade.estado = Estado()..id = row["cidade"]["estado_id"];
      cidade.nome = row["cidade"]["nome"];
      cidades.add(cidade);
    }
    return cidades;
  }

  //Retorna uma lista futura: Recebe um id do estado
  Future<List<Cidade>> pesquisarPorIDdoEstado(int idEstado) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    //retorna uma lista: Flutter 2.0 - Cria a lista fazia
    List<Cidade> cidades = List.empty(growable: true);
    //Faz a consulta
    List<
        Map<String,
            Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        """SELECT id, nome, estado_id from cidade where estado_id = @idEstado """,
        //Aplica uma filtro na consulta:
        substitutionValues: {"idEstado": idEstado});

    //Preenche a lista:
    for (final row in results) {
      Cidade cidade = Cidade();
      cidade.id = row["cidade"]["id"];
      //Relacionamento FK : os dois pontos retorna o objeto e com o ID retornado
      cidade.estado = Estado()..id = row["cidade"]["estado_id"];
      cidade.nome = row["cidade"]["nome"];
      cidades.add(cidade);
    }
    return cidades;
  }

  void getIdEstado(Cidade cidade) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    Estado estado = new Estado();
    estado.id = await conexao.execute(
        """SELECT estado_id from cidade where Cidade.id = @idCidade """,
        //Aplica uma filtro na consulta:
        substitutionValues: {"idCidade": cidade.id});
    cidade.estado = estado;
  }
}

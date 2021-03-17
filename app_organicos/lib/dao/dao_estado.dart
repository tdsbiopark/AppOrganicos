import 'package:app_organicos/modelo/estado.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class EstadoDAO {
  //Retorna uma lista futura: Recebe um texto para pesquisar
  Future<List<Estado>> listar() async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    //retorna uma lista: Flutter 2.0 - Cria a lista fazia
    List<Estado> estados = List.empty(growable: true);
    //Faz a consulta
    List<Map<String, Map<String, dynamic>>> results = await conexao
        .mappedResultsQuery("""SELECT id, nome, sigla from estado """,
            //Aplica uma filtro na consulta:
            substitutionValues: {});

    //Preenche a lista:
    for (final row in results) {
      Estado estado = Estado();
      estado.id = row["estado"]["id"];
      estado.nome = row["estado"]["nome"];
      estado.sigla = row["estado"]["sigla"];
      estados.add(estado);
    }
    return estados;
  }
}

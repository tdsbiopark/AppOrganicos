import 'package:app_organicos/modelo/tipo_produto.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class TipoProdutoDAO {
  //Retorna uma lista futura:
  Future<List<TipoProduto>> listar() async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    //Lista de objetos:
    List<TipoProduto> objetos = List.empty(growable: true);

    //Map de Resultados : Retorna a listagem (Map) dos dados da minha consulta: Semelhanta ao ResultSet do java:
    List<
        Map<String,
            Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        "SELECT * from tipoproduto where registro_ativo order by lower(nome)",
        substitutionValues: {}); //Sem filtros

    //Carrega cada linha em resultado: Map =chave é NOME_TABELA, Dynamics valores COLUNAS
    //Percorre cada linha e preenche o objeto: row["NOME_TANELA"]["NOME_CAMPO"];
    for (final row in results) {
      TipoProduto tipo = TipoProduto();
      tipo.id = row["tipoproduto"]["id"];
      tipo.nome = row["tipoproduto"]["nome"];
      tipo.ativo = row["tipoproduto"]["registro_ativo"];
      objetos.add(tipo);
    }
    return objetos;
  }
}

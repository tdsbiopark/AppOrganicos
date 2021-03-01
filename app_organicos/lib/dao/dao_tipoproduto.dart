import 'package:app_organicos/modelo/tipo_produto.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class TipoProdutoDAO {
  Future<List<TipoProduto>> listar() async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    List<TipoProduto> objetos = List();

    List<Map<String, Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        "SELECT * from tipoproduto where registro_ativo order by lower(nome)",
        substitutionValues: {});

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

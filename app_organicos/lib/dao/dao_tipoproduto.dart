import 'package:app_organicos/modelo/tipo_produto.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class TipoProdutoDAO {
  Future<void> gravar(TipoProduto tipoProduto) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    await conexao.transaction((ctx) async {
      if (tipoProduto.id == null || tipoProduto.id == 0) {
        await ctx.query("""insert into tipoProduto 
            (nome, registro_ativo) 
             VALUES (@nome, @ativo)""", substitutionValues: {
          "nome": tipoProduto.nome,
          "ativo": tipoProduto.ativo,
        });
      } else {
        await ctx.query("""update tipoProduto set nome = @nome, 
        registro_ativo = @ativo where id = @id""", substitutionValues: {
          "id": tipoProduto.id,
          "nome": tipoProduto.nome,
          "ativo": tipoProduto.ativo,
        });
      }
    });
  }

  Future<List<TipoProduto>> pesquisar(String filtro) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    List<TipoProduto> tipoProdutos = List.empty(growable: true);

    List<
        Map<String,
            Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        """SELECT id, nome, registro_ativo  from tipoProduto where registro_ativo and lower(nome) like @filtro limit 50""",
        substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    for (final row in results) {
      TipoProduto tipoProduto = TipoProduto();
      tipoProduto.id = row["tipoproduto"]["id"];
      tipoProduto.nome = row["tipoproduto"]["nome"];
      tipoProduto.ativo = row["tipoproduto"]["registro_ativo"];

      tipoProdutos.add(tipoProduto);
    }
    return tipoProdutos;
  }
}

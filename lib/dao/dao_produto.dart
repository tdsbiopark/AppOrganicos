import 'package:app_organicos/modelo/produto.dart';
import 'package:app_organicos/modelo/tipo_produto.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class ProdutoDAO {
  Future<void> gravar(Produto produto) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    await conexao.transaction((ctx) async {
      if (produto.id == null || produto.id == 0) {
        await ctx.query("""insert into produto 
            (tipoproduto_id, nome, descricao, unidade, preco_unitario, registro_ativo) 
             VALUES (@tipo, @nome, @descricao, @unidade, @preco, @ativo)""", substitutionValues: {
          "tipo": produto.tipo.id,
          "nome": produto.nome,
          "descricao": produto.descricao,
          "unidade": produto.unidade,
          "preco": produto.preco,
          "ativo": produto.ativo,
        });
      } else {
        await ctx.query("""update produto set tipoproduto_id = @tipo, nome = @nome, 
            descricao = @descricao, unidade = @unidade, preco_unitario = @preco, 
            registro_ativo = @ativo where id = @id""", substitutionValues: {
          "id": produto.id,
          "tipo": produto.tipo.id,
          "nome": produto.nome,
          "descricao": produto.descricao,
          "unidade": produto.unidade,
          "preco": produto.preco,
          "ativo": produto.ativo,
        });
      }
    });
  }

  Future<List<Produto>> pesquisar(String filtro) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    List<Produto> produtos = List();

    List<Map<String, Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        """SELECT id, tipoproduto_id, nome, descricao, cast(preco_unitario as float) as preco,
        unidade, registro_ativo  from produto where lower(nome) like @filtro limit 50""",
        substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    for (final row in results) {
      Produto produto = Produto();
      produto.id = row["produto"]["id"];
      produto.tipo = TipoProduto()..id = row["produto"]["tipoproduto_id"];
      produto.nome = row["produto"]["nome"];
      produto.descricao = row["produto"]["descricao"];
      produto.preco = row["produto"]["preco"];
      produto.unidade = row["produto"]["unidade"];
      produto.ativo = row["produto"]["registro_ativo"];

      produtos.add(produto);
    }
    return produtos;
  }
}

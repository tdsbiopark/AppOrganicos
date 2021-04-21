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

import 'package:app_organicos/modelo/produto.dart';
import 'package:app_organicos/modelo/tipo_produto.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class ProdutoDAO {
  //Faz Insert ou update: Recebe um produto / Assincrono - faz outras coisas emqnato ele grava
  Future<void> gravar(Produto produto) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    //Abre um bloco uma tranzação: com um contexto de dados: se der erro anula tudo
    await conexao.transaction((contexto) async {
      //Teste se é um objto novo
      if (produto.id == null || produto.id == 0) {
        //SQL insert:
        await contexto.query("""insert into produto 
            (tipoproduto_id, nome, descricao, unidade, preco_unitario, registro_ativo) 
             VALUES (@tipo, @nome, @descricao, @unidade, @preco, @ativo)""",
            //Parametros : proprio campo do objeto:
            substitutionValues: {
              "tipo": produto.tipo.id,
              "nome": produto.nome,
              "descricao": produto.descricao,
              "unidade": produto.unidade,
              "preco": produto.preco,
              "ativo": produto.ativo,
            });
      } else {
        await contexto
            .query("""update produto set tipoproduto_id = @tipo, nome = @nome, 
            descricao = @descricao, unidade = @unidade, preco_unitario = @preco, 
            registro_ativo = @ativo where id = @id""",
                //Parametros : proprio campo do objeto:
                substitutionValues: {
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

  //Retorna uma lista futura: Recebe um texto para pesquisar
  Future<List<Produto>> pesquisar(String filtro) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    //retorna uma lista: Flutter 2.0 - Cria a lista fazia
    List<Produto> produtos = List.empty(growable: true);
    //Faz a consulta
    List<
        Map<String,
            Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        """SELECT id, tipoproduto_id, nome, descricao, cast(preco_unitario as float) as preco,
        unidade, registro_ativo  from produto where registro_ativo and lower(nome) like @filtro limit 50""",
        //Aplica uma filtro na consulta:
        substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    //Preenche a lista de produtos:
    for (final row in results) {
      Produto produto = Produto();
      produto.id = row["produto"]["id"];
      //Relacionamento FK : os dois pontos retorna o objeto e com o ID retornado
      produto.tipo = TipoProduto()..id = row["produto"]["tipoproduto_id"];
      produto.nome = row["produto"]["nome"];
      produto.descricao = row["produto"]["descricao"];
      //devido ao cast prde a key de tabela, por isso usa a chave null
      produto.preco = row[null]["preco"];
      produto.unidade = row["produto"]["unidade"];
      produto.ativo = row["produto"]["registro_ativo"];
      produtos.add(produto);
    }
    return produtos;
  }
}

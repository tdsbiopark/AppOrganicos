import 'package:app_organicos/dao/dao_produto.dart';
import 'package:app_organicos/modelo/produto.dart';

class ControleProduto {
  ProdutoDAO _dao = ProdutoDAO();
  Produto produtoEmEdicao = Produto();
  Future<List<Produto>> fProdutosPesquisados;
  List<Produto> produtosPesquisados;

  Future<void> gravarProdutoEmEdicao() async {
    await _dao.gravar(produtoEmEdicao);
  }

  Future<void> atualizarPesquisa({String filtro = ""}) {
    fProdutosPesquisados = _dao.pesquisar(filtro);
  }
}

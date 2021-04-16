import 'package:app_organicos/dao/dao_tipoProduto.dart';
import 'package:app_organicos/modelo/tipo_produto.dart';

class ControleTipoProduto {
  TipoProdutoDAO _dao = TipoProdutoDAO();

  TipoProduto tipoProdutoEmEdicao = TipoProduto();

  Future<List<TipoProduto>> fTipoProdutoPesquisados;

  List<TipoProduto> tipoProdutoPesquisados;

  Future<void> gravarTipoProdutoEmEdicao() async {
    await _dao.gravar(tipoProdutoEmEdicao);
  }

  Future<void> atualizarPesquisa({String filtro = ""}) {
    fTipoProdutoPesquisados = _dao.pesquisar(filtro);
  }
}

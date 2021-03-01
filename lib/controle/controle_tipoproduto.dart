import 'package:app_organicos/dao/dao_tipoproduto.dart';
import 'package:app_organicos/modelo/tipo_produto.dart';

class ControleTipoProduto {
  TipoProdutoDAO dao = TipoProdutoDAO();

  Future<List<TipoProduto>> listar() async {
    return dao.listar();
  }
}

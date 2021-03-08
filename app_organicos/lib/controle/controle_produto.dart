import 'package:app_organicos/dao/dao_produto.dart';
import 'package:app_organicos/modelo/produto.dart';

class ControleProduto {
  //ja ven instanciado o DAO privado
  ProdutoDAO _dao = ProdutoDAO();
  //Obj. para editar na tela: faz o Biding em tela
  Produto produtoEmEdicao = Produto();
  //Lista Futura:guarda o que vem do banco
  Future<List<Produto>> fProdutosPesquisados;
  //Lista para uso em tela reflete a pesquisa
  List<Produto> produtosPesquisados;

  //Metodo assincrono para gravar:
  Future<void> gravarProdutoEmEdicao() async {
    await _dao.gravar(produtoEmEdicao);
  }

  //Metodo assincrono para pesquisar: opcional recebe um txt para pesquisa
  Future<void> atualizarPesquisa({String filtro = ""}) {
    fProdutosPesquisados = _dao.pesquisar(filtro);
  }
}

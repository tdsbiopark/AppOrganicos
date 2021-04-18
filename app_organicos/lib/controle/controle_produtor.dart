import 'package:app_organicos/dao/dao_cidade.dart';
import 'package:app_organicos/dao/dao_produtor.dart';
import 'package:app_organicos/modelo/estado.dart';
import 'package:app_organicos/modelo/produtor.dart';

class ControleProdutor {
  //DAO:
  ProdutorDao _dao = ProdutorDao();

  //Dao Cidade
  CidadeDAO _daoCid = CidadeDAO();

  //Obj
  Produtor produtorEmEdicao = Produtor();

  //Pega o estado no combo;
  Estado estadoSelecionado;

  //Lista Futura:guarda o que vem do banco
  Future<List<Produtor>> fProdutoresPesquisados;
  //Lista para uso em tela ()Biding, reflete a pesquisa
  List<Produtor> produtoresPesquisados;

  //Metodo assincrono para gravar:
  Future<void> gravarProdutorEmEdicao() async {
    await _dao.gravar(produtorEmEdicao);
  }

  //Metodo assincrono para pesquisar: opcional recebe um txt para pesquisa
  Future<void> atualizarPesquisa({String filtro = ""}) {
    fProdutoresPesquisados = _dao.pesquisar(filtro);
  }

  //Definir o estado com base na cidade selecionada:
  void setEstadoSelecionado() {
    if (produtorEmEdicao.cidade != null) {
      _daoCid.getIdEstado(produtorEmEdicao.cidade);
      estadoSelecionado = produtorEmEdicao.cidade.estado;
    }
  }
}

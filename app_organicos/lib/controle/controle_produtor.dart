import 'package:app_organicos/dao/dao_produtor.dart';
<<<<<<< HEAD
import 'package:app_organicos/modelo/estado.dart';
=======
>>>>>>> DevelopJonas
import 'package:app_organicos/modelo/produtor.dart';

class ControleProdutor {
  //DAO:
  ProdutorDao _dao = ProdutorDao();
  //Obj
  Produtor produtorEmEdicao = Produtor();
<<<<<<< HEAD

  //Pega o estado no combo;
  Estado estadoSelecionado;

=======
>>>>>>> DevelopJonas
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
}

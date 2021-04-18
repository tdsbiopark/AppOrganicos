import 'package:app_organicos/dao/dao_produtor.dart';
import 'package:app_organicos/modelo/certificadora.dart';
import 'package:app_organicos/modelo/estado.dart';
import 'package:app_organicos/modelo/grupo.dart';
import 'package:app_organicos/modelo/produtor.dart';

class ControleProdutor {
  //DAO:
  ProdutorDao _dao = ProdutorDao();
  //Obj
  Produtor produtorEmEdicao = Produtor();

  //Pega o estado no combo;
  Estado estadoSelecionado;

  //Pega a certificadora no combo;
  Certificadora certificadoraSelecionada;

  //Pega a certificadora no combo;
  Grupo grupoSelecionada;

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

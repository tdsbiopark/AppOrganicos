import 'package:app_organicos/dao/dao_cidade.dart';
import 'package:app_organicos/modelo/cidade.dart';

class ControleCidade {
  //ja ven instanciado o DAO privado
  CidadeDAO _dao = CidadeDAO();
  //Obj. para editar na tela: faz o Biding em tela
  Cidade cidadeSelecionada = Cidade();
  //Lista Futura:guarda o que vem do banco
  Future<List<Cidade>> fCidadePesquisadas;
  //Lista para uso em tela reflete a pesquisa
  List<Cidade> cidadesPesquisadas;

  //Metodo assincrono para pesquisar: opcional recebe um txt para pesquisa
  Future<void> atualizarPesquisa({String filtro = ""}) {
    fCidadePesquisadas = _dao.pesquisar(filtro);
  }

  //Metodo assincrono para pesquisar: opcional recebe um id do Estado para pesquisa
  Future<void> atualizarPesquisaPorEstado({int filtro = 0}) {
    fCidadePesquisadas = _dao.pesquisarPorIDdoEstado(filtro);
  }
}

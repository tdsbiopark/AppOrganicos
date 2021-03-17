import 'package:app_organicos/dao/dao_estado.dart';
import 'package:app_organicos/modelo/estado.dart';

class ControleEstado {
  //ja ven instanciado o DAO privado
  EstadoDAO _dao = EstadoDAO();
  //Obj. para editar na tela: faz o Biding em tela
  Estado estadoSelecionado = Estado();
  //Lista Futura:guarda o que vem do banco
  Future<List<Estado>> fCidadePesquisadas;
  //Lista para uso em tela reflete a pesquisa
  List<Estado> cidadesPesquisadas;

  //Metodo assincrono para pesquisar: opcional recebe um txt para pesquisa
  Future<void> atualizarLista() {
    fCidadePesquisadas = _dao.listar();
  }
}

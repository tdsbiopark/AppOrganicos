import 'package:app_organicos/dao/dao_cidade.dart';
import 'package:app_organicos/modelo/cidade.dart';

class ControleCidade {
  //ja ven instanciado o DAO privado
  CidadeDAO _dao = CidadeDAO();

  Future<List<Cidade>> listar(int idEstado) async {
    if (idEstado == null || idEstado == 0) {
      //retorna a lista futura vazia
      return Future.value(new List<Cidade>());
    }
    return _dao.pesquisarPorIDdoEstado(idEstado);
  }
}

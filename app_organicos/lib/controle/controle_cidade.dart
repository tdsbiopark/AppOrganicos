import 'package:app_organicos/dao/dao_cidade.dart';
import 'package:app_organicos/modelo/cidade.dart';

class ControleCidade {
  //ja ven instanciado o DAO privado
  CidadeDAO _dao = CidadeDAO();

  Future<List<Cidade>> listar(int idEstado) async {
    return _dao.pesquisarPorIDdoEstado(idEstado);
  }
}

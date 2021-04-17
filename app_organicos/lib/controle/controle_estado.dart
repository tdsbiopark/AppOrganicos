import 'package:app_organicos/dao/dao_estado.dart';
import 'package:app_organicos/modelo/estado.dart';

import '../modelo/estado.dart';

class ControleEstado {
  //ja ven instanciado o DAO privado
  EstadoDAO _dao = EstadoDAO();

  Future<List<Estado>> listar() async {
    return _dao.listar();
  }
}

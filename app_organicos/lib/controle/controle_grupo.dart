import 'package:app_organicos/dao/dao_Grupo.dart';
import 'package:app_organicos/modelo/Grupo.dart';

class ControleGrupo {
  GrupoDAO _dao = GrupoDAO();
  Grupo grupoEmEdicao = Grupo();
  Future<List<Grupo>> fGruposPesquisadas;
  List<Grupo> GruposPesquisadas;

  Future<void> gravarGrupoEmEdicao() async {
    await _dao.gravar(grupoEmEdicao);
  }

  Future<Grupo> atualizarPesquisa({String filtro = ""}) {
    fGruposPesquisadas = _dao.pesquisar(filtro);
  }
}

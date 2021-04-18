import 'package:app_organicos/dao/dao_grupo.dart';
import 'package:app_organicos/modelo/estado.dart';
import 'package:app_organicos/modelo/grupo.dart';

class ControleGrupo {
  GrupoDao _dao = GrupoDao();

  Grupo grupoEmEdicao = Grupo();

  //Pega o estado no combo;
  Estado estadoSelecionado;

  Future<List<Grupo>> fGruposPesquisados;

  List<Grupo> gruposPesquisados;

  Future<void> gravarGrupoEmEdicao() async {
    await _dao.gravar(grupoEmEdicao);
  }

  Future<void> atualizarPesquisa({String filtro = ""}) {
    fGruposPesquisados = _dao.pesquisar(filtro);
  }

  Future<List<Grupo>> listar() async {
    return _dao.pesquisar("");
  }
}

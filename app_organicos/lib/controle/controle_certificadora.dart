import 'package:app_organicos/dao/dao_certificadora.dart';
import 'package:app_organicos/modelo/certificadora.dart';

class ControleCertificadora {
  CertificadoraDAO _dao = CertificadoraDAO();
  Certificadora certificadoraEmEdicao = Certificadora();
  Future<List<Certificadora>> fCertificadorasPesquisadas;
  List<Certificadora> certificadorasPesquisadas;

  Future<void> gravarCertificadoraEmEdicao() async {
    await _dao.gravar(certificadoraEmEdicao);
  }

  Future<void> atualizarPesquisa({String filtro = ""}) {
    fCertificadorasPesquisadas = _dao.pesquisar(filtro);
  }

  Future<List<Certificadora>> listar() async {
    return _dao.pesquisar("");
  }
}

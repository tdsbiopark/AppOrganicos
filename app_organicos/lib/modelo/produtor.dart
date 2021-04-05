import 'package:app_organicos/modelo/certificadora.dart';
import 'package:app_organicos/modelo/grupo.dart';
import 'package:app_organicos/modelo/produto.dart';
import 'certificadora.dart';
import 'cidade.dart';
import 'grupo.dart';

class Produtor {
  int id;
  String nome;
  String nomePropriedade;
  String cpfCnpj;
  String endereco;
  String numero;
  String bairro;
  String telefone;
  String latitude;
  String longitude;
  String certificacaoOrganicos;
  bool vendaConsumidorFinal;
  bool ativo = true;
  Cidade cidade;
  Certificadora certificadora = new Certificadora();
  Grupo grupo = new Grupo();
  List<Produto> produtos = new List<Produto>();

  //Teste para gravar sem implementar grupo e certificadora
  // Produtor() {
  //   grupo.id = 1;
  //   certificadora.id = 1;
  // }
}

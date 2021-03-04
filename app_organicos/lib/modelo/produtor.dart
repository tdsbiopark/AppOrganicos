import 'package:app_organicos/modelo/certificadora.dart';
import 'package:app_organicos/modelo/endereco.dart';
import 'package:app_organicos/modelo/grupo.dart';

class Produtor {
  int id;
  Certificadora certificadora;
  Grupo grupo;
  Endereco endereco;
  String nome;
  String nomePropriedade;
  String cpfCnpj;
  String telefone;
  String certificacaoOrganicos;
  bool vendaConsumidorFinal;
  bool ativo = true;
}

import 'package:app_organicos/modelo/certificadora.dart';
import 'package:app_organicos/modelo/grupo.dart';
import 'cidade.dart';

class Produtor {
  int id;
  Certificadora certificadora;
  Grupo grupo;
  String nome;
  String nomePropriedade;
  String cpfCnpj;
  String endereco;
  String numero;
  String bairro;
  Cidade cidade;
  String telefone;
  String latitude;
  String longitude;
  String certificacaoOrganicos;
  bool vendaConsumidorFinal;
  bool ativo = true;
}

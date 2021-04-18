import 'package:app_organicos/modelo/cidade.dart';

class Grupo {
  int id;
  String nome;
  String endereco;
  int numero;
  String bairro;
  Cidade cidade;
  String cnpj;
  String incricaoEstadual;
  bool distribuidor;
  bool ativo = true;

  //para poder percorrer na combobox na tela de cadastro
  //tem que ser um tipo e o id deve ser igual
  bool operator ==(other) {
    return (other is Grupo && other.id == this.id);
  }
}

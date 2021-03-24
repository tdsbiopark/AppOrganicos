import 'package:app_organicos/modelo/estado.dart';

class Cidade {
  int id;
  String nome;
  Estado estado = Estado();

  //para poder percorrer na combobox na tela de cadastro
  //tem que ser um tipo e o ide tem que ser igual
  bool operator ==(other) {
    return (other is Cidade && other.id == this.id);
  }
}

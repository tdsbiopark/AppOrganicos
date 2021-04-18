class Certificadora {
  int id;
  String nome;
  bool ativo = true;

  //para poder percorrer na combobox na tela de cadastro
  //tem que ser um tipo e o id deve ser igual
  bool operator ==(other) {
    return (other is Certificadora && other.id == this.id);
  }
}

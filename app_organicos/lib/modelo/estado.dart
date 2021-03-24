class Estado {
  int id;
  String nome;
  String sigla;
<<<<<<< HEAD

  //para poder percorrer na combobox na tela de cadastro
  //tem que ser um tipo e o ide tem que ser igual
  bool operator ==(other) {
    return (other is Estado && other.id == this.id);
  }
=======
>>>>>>> DevelopJonas
}

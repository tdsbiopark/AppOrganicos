class TipoProduto {
  int id;
  String nome;
  bool ativo;

  //para pode r percorrer na combobox na tela de cadastro
  //tem que ser um tipo e o ide tem que ser igual
  bool operator ==(other) {
    return (other is TipoProduto && other.id == this.id);
  }
}

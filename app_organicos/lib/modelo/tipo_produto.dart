class TipoProduto {
  int id;
  String nome;
  bool ativo;

  bool operator ==(other) {
    return (other is TipoProduto && other.id == this.id);
  }
}

class Livro {
  late int id;
  late String titulo;
  //late String descricao;
  //late String autor;
  late double valor;
  late String urlImagem;

  Livro(
      {int? id,
      required String titulo,
      //required String descricao,
      //required String autor,
      required double valor,
      required String urlImagem}) {
    if (id != null) {
      this.id = id;
    }
    this.titulo = titulo;
    //this.descricao = descricao;
    //this.autor = autor;
    this.valor = valor;
    this.urlImagem = urlImagem;
  }
}

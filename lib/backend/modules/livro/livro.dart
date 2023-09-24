class Livro {
  late int id;
  late String titulo;
  late String descricao;
  late String autor;
  late double preco;
  late String numPaginas;
  late String urlImagem;
  late String anoPublicado;

  Livro(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.autor,
      required this.preco,
      required this.urlImagem,
      required this.numPaginas,
      required this.anoPublicado});

  Livro.cadastro({required this.titulo, required this.descricao, required this.autor, required this.preco, required this.urlImagem, required this.numPaginas, required this.anoPublicado});  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['autor'] = this.autor;
    data['preco'] = this.preco;
    data['descricao'] = this.descricao;
    data['url_imagem'] = this.urlImagem;
    data['numero_paginas'] = this.numPaginas;
    data['ano_publicado'] = this.anoPublicado;

    return data; 
  }

    Livro.fromJson(Map<String, dynamic> data) {

    id = data['id'] ;
    titulo = data['titulo'];
    autor = data['autor'];
    preco= data['preco'];
    descricao = data['descricao'];
    urlImagem = data['url_imagem'];
    numPaginas = data['numero_paginas'];
    anoPublicado = data['ano_publicado'];
    
  }

}

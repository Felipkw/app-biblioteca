class Usuario {
  late int id;
  late String nome;
  late String email;
  late String senha;
  late Stream urlFoto;

  Usuario({int? id, String? urlFoto, required String email, required String nome, required String senha}) {
    this.nome = nome;
    this.email = email;
    this.senha = senha;

    if (id != null) {
      this.id = id;
    }

    if (urlFoto != null) {
      this.urlFoto = urlFoto as Stream;
    }
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = senha;
    data['urlFoto'] = urlFoto;

    return data;
  }*/


  @override
  String toString() {
    return "Usuario(id: $id, nome: $nome, email: $email, senha: $senha, urlFoto: $urlFoto)";
  }
}
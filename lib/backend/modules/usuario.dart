class Usuario {
  late int id;
  late String nome;
  late String email;
  late String senha;
  late Stream urlFoto;

  Usuario(String nome, String email, String senha, {int? id, String? urlFoto}) {
    this.nome = nome;
    this.email = email;
    this.senha = senha;

    if (id != null) {
      this.id = id;
    }

    if (urlFoto != null) {
      this.urlFoto = urlFoto;
    }
  }
}

class Usuario {
  late int id;
  late String nome;
  late String email;
  late String senha;
  late String urlFoto;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.urlFoto,
  });

  Usuario.cadastro(
      {required this.nome, required this.email, required this.senha});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = senha;
    data['url_foto'] = urlFoto;

    return data;
  }

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['name'];
    email = json['email'];
    senha = json['senha'];
    urlFoto = json['url_fhto'];
  }
}
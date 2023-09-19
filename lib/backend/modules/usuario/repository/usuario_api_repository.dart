import 'dart:convert';

import 'package:app_biblioteca/backend/modules/usuario/repository/interface/interface_usuario_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';

import 'package:http/http.dart' as http;

class UsuarioApiRepository implements IUsuarioRepository {
  @override
  Future<Usuario> criar({required Usuario usuario}) async {
    Map<String, dynamic> request = {
      'name': usuario.nome,
      'email': usuario.email,
      'password': usuario.senha
    };

    print(request);

    final uri = Uri.parse(
        "3333-felipkw-appbiblioteca-yg02c40d871.ws-us104.gitpod.io/users");
    final response = await http.post(uri, body: request);

    print(response.body);

    if (response.statusCode == 201) {
      Usuario usuario = Usuario.fromJson(json.decode(response.body));
      return usuario;
    } else {
      throw Exception('Falha ao cadastrar usuário');
    }
  }

  @override
  Future<bool> autenticar({required String email, required String senha}) {
    // TODO: implement autenticar
    throw UnimplementedError();
  }
}

import 'dart:convert';

import 'package:app_biblioteca/backend/modules/usuario/repository/interface/interface_usuario_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';

import 'package:http/http.dart' as http;

class UsuarioApiRepository implements IUsuarioRepository {
  @override
  criar({required Usuario usuario}) async {
    Map<String, dynamic> request = {
      'name': usuario.nome,
      'email': usuario.email,
      'password': usuario.senha
    };

    final uri = Uri.parse("https://localhost:3333/users");
    final response = await http.post(uri, body: request);

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

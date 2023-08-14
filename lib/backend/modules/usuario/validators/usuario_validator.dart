import '../usuario.dart';

class UsuarioValidator {
  void nomeValidator({required String nome}) {
    if (nome == '' || nome.isEmpty) {
      throw Exception("Campo nome vazio!");
    }

    print("nome válido");
  }

  void emailValidator({required String email}) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email)) {
      throw Exception("E-mail inválido.");
    }

    print("email valido");
  }

  void senhaValidator({required String senha}) {
    if (senha.length < 8) {
      throw Exception("A senha possui menos de 8 caracteres.");
    }

    print("nome válido");
  }

  void fullUsuarioValidator({required Usuario usuario}) {
    try {
      nomeValidator(nome: usuario.nome);
      emailValidator(email: usuario.email);
      senhaValidator(senha: usuario.senha);
    } catch (exception) {
      rethrow;
    }

    print("usuario válido, tchow");
  }
}

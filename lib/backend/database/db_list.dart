import '../modules/usuario/usuario.dart';

class DBList {
  late List<Usuario> usuarios = [];

  DBList() {
    Usuario usuario =
        Usuario(id: 1, nome: "teste", email: "teste@mail.com", senha: "12345678");
    usuarios.add(usuario);
  }
}

//import 'package:app_biblioteca/backend/database/db_list.dart';
//import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_list_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario_controller.dart';

Future<void> main() async {
  Usuario usuario1 =
      Usuario(nome: "adelson", email: "adelson@mail.com", senha: "12345678");

  Usuario usuario2 =
      Usuario(nome: "felipe", email: "felipe@mail.com", senha: "12345678");

  Usuario usuario3 =
      Usuario(nome: "maria", email: "maria@mail.com", senha: "12345678");

  UsuarioController usuarioController = UsuarioController();

  usuarioController.criar(usuario: usuario1);
  usuarioController.criar(usuario: usuario2);
  usuarioController.criar(usuario: usuario3);

  List<Usuario> listaUsuarios = usuarioController.listar();

  print(listaUsuarios.length);

  for (Usuario usuario in listaUsuarios) {
    //usuario.toString;
    print(usuario.id);
    print(usuario.nome);
    print(usuario.email);
    print(usuario.senha);
    print("\n");
  }

  print("chegou aqui");

  if (await usuarioController.autenticar(
      email: "maria@mail.com", senha: "12345678")) {
    print("dados certos tchow");
  } else {
    print("dados errados tchow");
  }
}

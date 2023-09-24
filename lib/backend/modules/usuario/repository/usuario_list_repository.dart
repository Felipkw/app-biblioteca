import 'package:app_biblioteca/backend/database/db_list.dart';
import 'package:app_biblioteca/backend/modules/usuario/repository/interface/interface_usuario_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';

class UsuarioListRepository implements IUsuarioRepository {
  late DBList dbList;

  UsuarioListRepository() {
    dbList = DBList();
  }

  @override
  Future<void> criar({required Usuario usuario}) async {
    await Future.delayed(const Duration(seconds: 2));
    usuario.id = dbList.usuarios.length + 1;

    dbList.usuarios.add(usuario);

  }

  List<Usuario> listar() {
    return dbList.usuarios;
  }

  @override
  Future<bool> autenticar(
      {required String email, required String senha}) async {
    bool autenticado = false;

    for (Usuario usuario in dbList.usuarios) {
      if (usuario.email == email && usuario.senha == senha) {
        autenticado = true;
      }
    }

    await Future.delayed(const Duration(seconds: 2));
    return autenticado;
  }

  @override
  Future<bool> emailExiste({required String email}) async {
    bool existe = false;

    for (Usuario usuario in dbList.usuarios) {
      if (usuario.email == email) {
        existe = true;
      }
    }

    await Future.delayed(const Duration(seconds: 2));

    return existe;
  }
}

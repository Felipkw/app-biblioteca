//import 'package:app_biblioteca/backend/database/db_list.dart';
import 'package:app_biblioteca/backend/modules/usuario/repository/interface/interface_usuario_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';

class UsuarioListRepository implements IUsuarioRepository {
  late List<Usuario> usuarios;

  UsuarioListRepository() {
    usuarios = [];
  }

  @override
  Future<void> criar({required Usuario usuario}) async {
    //DBList dbList = DBList();
    await Future.delayed(const Duration(seconds: 1));
    usuario.id = usuarios.length + 1;
    usuarios.add(usuario);
    print("usuario cadastrado");
  }

  @override
  List<Usuario> listar() {
    return usuarios;
  }
}

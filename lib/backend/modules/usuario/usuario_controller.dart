import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_list_repository.dart';
//import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_sqlite_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario_service.dart';

class UsuarioController {
  UsuarioListRepository? usuarioRepository;
  UsuarioService? usuarioService;

  UsuarioController() {
    usuarioRepository = UsuarioListRepository();
    usuarioService = UsuarioService(usuarioRepository!);
  }

  Future<void> criar({required Usuario usuario}) async {
    await usuarioService?.criar(usuario: usuario);
  }

  List<Usuario> listar() {
    return usuarioService!.listar();
  }
}

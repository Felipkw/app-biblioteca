//import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_list_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_sqlite_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario_service.dart';

class UsuarioController {
  UsuarioSqliteRepository? usuarioRepository;
  UsuarioService? usuarioService;

  UsuarioController() {
    usuarioRepository = UsuarioSqliteRepository();
    usuarioService = UsuarioService(usuarioRepository!);
  }

  Future<void> criar({required Usuario usuario}) async {
    await usuarioService?.criar(usuario: usuario);
  }

  Future<bool> autenticar({required email, required senha}) async {
    return usuarioService!.autenticar(email: email, senha: senha);
  }

  Future<bool> emailExiste({required String email}) {
    return usuarioService!.emailExiste(email: email);
  }
}

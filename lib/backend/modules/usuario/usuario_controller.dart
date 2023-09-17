import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_api_repository.dart';
//import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_sqlite_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario_service.dart';

class UsuarioController {
  UsuarioApiRepository? usuarioRepository;
  UsuarioService? usuarioService;

  UsuarioController() {
    usuarioRepository = UsuarioApiRepository();
    usuarioService = UsuarioService(usuarioRepository!);
  }

  Future<bool?> criar({required Usuario usuario}) async {
    bool? usuarioCriado = await usuarioService?.criar(usuario: usuario);
    return usuarioCriado;
  }

  Future<bool> autenticar({required email, required senha}) async {
    return usuarioService!.autenticar(email: email, senha: senha);
  }


}

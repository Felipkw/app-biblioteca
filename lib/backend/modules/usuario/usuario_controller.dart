

import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_sqlite_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario_service.dart';

class UsuarioController{

  UsuarioSQLiteRepository? usuarioRepository;
  UsuarioService? usuarioService;

  UsuarioController(){
    usuarioRepository = UsuarioSQLiteRepository();
    usuarioService = UsuarioService(usuarioRepository!);
  }

  Future<void> criar({required Usuario usuario}) async {
    await usuarioService?.criar(usuario: usuario);
  }

  

}
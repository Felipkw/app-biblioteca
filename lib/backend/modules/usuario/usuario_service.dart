import 'package:app_biblioteca/backend/modules/usuario/repository/interface/interface_usuario_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/validators/usuario_validator.dart';

class UsuarioService {
  IUsuarioRepository usuarioRepository;

  UsuarioService(this.usuarioRepository);

  Future<bool> criar({required Usuario usuario}) async {
    try {
      UsuarioValidator().fullUsuarioValidator(usuario: usuario);
    } catch (e) {
      rethrow;
    }
    Usuario usuarioCriado = await usuarioRepository.criar(usuario: usuario);

    if (usuarioCriado != null) {
      return false;
    }
    
    return true;
  }

  Future<bool> autenticar(
      {required String email, required String senha}) async {
    try {
      UsuarioValidator().emailValidator(email: email);
      UsuarioValidator().senhaValidator(senha: senha);
    } catch (e) {
      rethrow;
    }
    return usuarioRepository.autenticar(email: email, senha: senha);
  }
}

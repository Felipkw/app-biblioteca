import 'package:app_biblioteca/backend/modules/usuario/repository/interface/interface_usuario_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/validators/usuario_validator.dart';

class UsuarioService {
  IUsuarioRepository usuarioRepository;

  UsuarioService(this.usuarioRepository);

  Future<void> criar({required Usuario usuario}) async {
    try {
      UsuarioValidator().fullUsuarioValidator(usuario: usuario);
    } catch (e) {
      rethrow;
    }
    await usuarioRepository.criar(usuario: usuario);
  }

  List<Usuario> listar() {
    return usuarioRepository.listar();
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


  Future<bool> emailExiste({required String email}) async {

    try{
      UsuarioValidator().emailValidator(email: email);
    } catch(e){
      rethrow;
    }

    return usuarioRepository.emailExiste(email: email);

  }
}

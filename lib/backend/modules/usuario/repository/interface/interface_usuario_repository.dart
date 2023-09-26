import '../../usuario.dart';

abstract class IUsuarioRepository {
  criar({required Usuario usuario});
  Future<bool> autenticar({required String email, required String senha});
  Future<bool> emailExiste({required String email});
}

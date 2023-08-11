import '../../usuario.dart';

abstract class IUsuarioRepository{

  Future<bool> autenticar({required String email, required String password});
  Future<void> criar({required Usuario usuario});
  Future<Usuario> pesquisar({required String id});
  Future<void> atualizar({required Usuario updatedUsuario, required String id});
  Future<void> deletar({required String id});

}
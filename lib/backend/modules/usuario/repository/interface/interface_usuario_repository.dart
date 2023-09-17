import '../../usuario.dart';

abstract class IUsuarioRepository {
  Future<Usuario> criar({required Usuario usuario});
  //List<Usuario> listar();
  Future<bool> autenticar({required String email, required String senha});
  //Future<Usuario> pesquisar({required int id});
  //Future<void> atualizar({required Usuario updatedUsuario, required int id});
  //Future<void> deletar({required int id});
}

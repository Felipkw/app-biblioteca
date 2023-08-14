import '../../usuario.dart';

abstract class IUsuarioRepository {
  /*Future<void>*/ criar({required Usuario usuario});
  List<Usuario> listar();
  Future<bool> autenticar({required String email, required String senha});
  //Future<Usuario> pesquisar({required String id});
  //Future<void> atualizar({required Usuario updatedUsuario, required String id});
  //Future<void> deletar({required String id});
}

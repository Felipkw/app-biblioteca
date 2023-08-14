//import 'package:app_biblioteca/backend/database/db_list.dart';
//import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_list_repository.dart';
import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/backend/modules/livro/livro_controller.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario_controller.dart';

Future<void> main() async {
  //UsuarioController usuarioController = UsuarioController();
  LivroController livroController = LivroController();
  livroController.listar();


}

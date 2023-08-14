import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/backend/modules/livro/livro_sesrvice.dart';
import 'package:app_biblioteca/backend/modules/livro/repository/livro_list_repository.dart';

class LivroController {
  LivroListRepository? livroListRepository;
  LivroService? livroService;

  Future<List<Livro>> listar() async {
    return livroService!.listar();
  }
}

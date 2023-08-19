import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/backend/modules/livro/livro_service.dart';
import 'package:app_biblioteca/backend/modules/livro/repository/livro_list_repository.dart';

class LivroController {
  LivroListRepository? livroListRepository;
  LivroService? livroService;

  LivroController() {
    livroListRepository = LivroListRepository();
    livroService = LivroService(livroListRepository!);
  }

  Future<List<Livro>> listar() async {
    return livroService!.listar();
  }
}

import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/backend/modules/livro/livro_service.dart';
import 'package:app_biblioteca/backend/modules/livro/repository/livro_sqlite_repository.dart';

class LivroController {
  LivroSqliteRepository? livroSqliteRepository;
  LivroService? livroService;

  LivroController() {
    livroSqliteRepository = LivroSqliteRepository();
    livroService = LivroService(livroSqliteRepository!);
  }

  Future<List<Livro>> listar() async {
    return livroService!.listar();
  }
}

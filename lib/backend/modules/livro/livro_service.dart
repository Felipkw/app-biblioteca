import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/backend/modules/livro/repository/interface/interface_livro_repository.dart';

class LivroService {
  ILivroRepository livroRepository;
  LivroService(this.livroRepository);

  Future<List<Livro>> listar() async {
    return livroRepository.listar();
  }
}

import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/backend/modules/livro/repository/interface/interface_livro_repository.dart';

import '../../../database/db_list.dart';

class LivroListRepository implements ILivroRepository {
  late DBList dbList;

  LivroListRepository() {
    dbList = DBList();
  }

  @override
  Future<List<Livro>> listar() async {
    await Future.delayed(const Duration(seconds: 2));
    return dbList.livros;
  }
}

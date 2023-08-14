import 'package:app_biblioteca/backend/modules/livro/livro.dart';

abstract class ILivroRepository {
  Future<List<Livro>> listar();
}

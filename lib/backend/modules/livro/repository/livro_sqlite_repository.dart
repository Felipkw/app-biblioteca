import 'package:app_biblioteca/backend/database/db_helper.dart';
import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:app_biblioteca/backend/modules/livro/repository/interface/interface_livro_repository.dart';

class LivroSqliteRepository implements ILivroRepository{

   @override
     Future<List<Livro>> listar() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM LIVROS;';
    final resultSet = await db.rawQuery(sql);
    print(resultSet);

    List<Livro> list = [];
    for (var json in resultSet) {
      print(json);
      Livro livro = Livro.fromJson(json);
      list.add(livro);
    }

    return list;
  }
  
}
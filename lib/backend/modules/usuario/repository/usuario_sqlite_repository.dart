import 'package:app_biblioteca/backend/database/db_helper.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:sqflite/sqlite_api.dart';
import './interface/interface_usuario_repository.dart';

class UsuarioSqliteRepository implements IUsuarioRepository {
  @override
  Future<bool> autenticar(
      {required String email, required String senha}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM usuarios '
        'WHERE email = ? '
        'AND senha = ?;';

    final resultSet = await db.rawQuery(sql, [email, senha]);

    return resultSet.isNotEmpty;
  }

  @override
  criar({required Usuario usuario}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();
    db.insert('usuarios', usuario.toJsonCadastro());
  }

  @override
  Future<bool> emailExiste({required String email}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();
    final result =
        await db.query('usuarios', where: 'email = ?', whereArgs: [email]);
    return result.isNotEmpty; //
  }
}

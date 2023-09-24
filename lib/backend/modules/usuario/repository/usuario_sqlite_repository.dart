import 'package:app_biblioteca/backend/database/db_helper.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:sqflite/sqlite_api.dart';
import './interface/interface_usuario_repository.dart';

class UsuarioSqliteRepository implements IUsuarioRepository {
  @override
  Future<bool> autenticar({required String email, required String senha}) {
    throw UnimplementedError();
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

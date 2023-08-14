import 'package:app_biblioteca/backend/database/db_helper.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'interface/interface_usuario_repository.dart';

class UsuarioSQLiteRepository /*implements IUsuarioRepository*/ {
  @override
  Future<void> criar({required Usuario usuario}) async {
    try {
      DBHelper dbHelper = DBHelper();
      Database db = await dbHelper.initDB();

      print('ENTROU NO REPOSITORY CACETE');

      String sql =
          """INSERT INTO usuarios(nome, email, senha ) VALUES(?, ?, ?);""";

      await db.rawInsert(sql, [
        usuario.nome,
        usuario.email,
        usuario.senha
      ]);

      print("Usuario criado com sucesso!");

      await db.close();
    } catch (error) {
      throw Exception(error);
    }
  }
}

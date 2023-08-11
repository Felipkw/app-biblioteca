import 'package:app_biblioteca/backend/modules/usuario/repository/usuario_sqlite_repository.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/validators/usuario_validator.dart';



void main() {
  Usuario usuario =
      Usuario(nome: "João", email: "joao2@mail.com", senha: "12345678");

  print(usuario.nome);
  print(usuario.email);
  print(usuario.senha);

  UsuarioValidator usuarioValidator = UsuarioValidator();
  usuarioValidator.fullUsuarioValidator(usuario: usuario);

  UsuarioSQLiteRepository usuarioSQLiteRepository = UsuarioSQLiteRepository();
  usuarioSQLiteRepository.criar(usuario: usuario);

  

  
}

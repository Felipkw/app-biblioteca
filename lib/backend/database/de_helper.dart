import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = join(await getDatabasesPath(), "livraria.db");

    Database database =
        await openDatabase(path, version: 1, onCreate: _onCreate);

    return database;
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    String createTable = """
    CREATE TABLE usuarios(
  	  id INTEGER PRIMARY KEY AUTOINCREMENT,
	    nome TEXT NOT NULL,
  	  email TEXT NOT NULL UNIQUE,
  	  senha TEXT NOT NULL,
  	  url_foto TEXT
    );
    CREATE TABLE livros(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
	    titulo TEXT NOT NULL,
      autor TEXT NOT NULL,
  	  preco REAL NOT NULL,
  	  descricao TEXT NOT NULL,
  	  url_imagem TEXT NOT NULL,
      numero_paginas TEXT NOT NULL,
      ano_publicado TEXT NOT NULL
    );
    CREATE TABLE livros_usuarios(
      id_usuario  INTEGER NOT NULL,
      id_livro    INTEGER NOT NULL,
      FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
      FOREIGN KEY (id_livro) REFERENCES livros(id)
    );
    """;
    await db.execute(createTable);

    String insert =
        """INSERT INTO usuarios(nome, email, senha) VALUES("teste", "teste@mail.com", "12345678");""";
    await db.execute(insert);

    insert =
        """INSERT INTO usuarios(nome, email, senha) VALUES("adelson", "adelson@mail.com", "12345678");""";
    await db.execute(insert);
  }
}
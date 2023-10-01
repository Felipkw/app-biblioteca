import 'package:app_biblioteca/pages/tela_inicial.dart';
import 'package:app_biblioteca/pages/tela_principal.dart';
import 'package:flutter/material.dart';

//import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
    ),
  );
}

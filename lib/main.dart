import 'package:app_biblioteca/bloc/favoritos_cubit.dart';
import 'package:app_biblioteca/pages/tela_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => FavoritosCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TelaSplash(),
      ),
    ),
  );
}

import 'package:app_biblioteca/backend/database/db_list.dart';
import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/pages/tela_usuario.dart';
import 'package:flutter/material.dart';

import '../backend/modules/livro/livro_controller.dart';
import '../widgets/card_livro.dart';

class TelaLivrosUsuario extends StatefulWidget {
  const TelaLivrosUsuario({super.key});

  @override
  State<TelaLivrosUsuario> createState() => _TelaLivrosUsuarioState();
}

class _TelaLivrosUsuarioState extends State<TelaLivrosUsuario> {

  LivroController livroController = LivroController();
  Future<List<Livro>> listaLivros = LivroController().listar();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff6A1B9A),
                Colors.black,
              ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Center(
              child: Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                          'https://atualinerd.com.br/wp-content/uploads/2022/05/Naruto-Shikamaru-8.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Nome de usuário',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GridView.count(
                      padding: EdgeInsets.all(10),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: lis
                    )
                  ],
                ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}

buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text('SUA BIBLIOTECA', style: TextStyle(fontSize: 15)),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 16,
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TelaUsuario()));
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.menu,
          size: 16,
        ),
        onPressed: () {},
      ),
    ],
  );
}

buildLista({required Future<List<Livro>> listaLivros}) {
  return  FutureBuilder(
      future: listaLivros,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return CardLivro(
                livro: list[index],
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    
  );
}
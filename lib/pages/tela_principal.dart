import 'package:app_biblioteca/pages/tela_usuario.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/widgets/card_livro.dart';
import 'package:app_biblioteca/widgets/drawer_widget.dart';
import 'package:app_biblioteca/backend/modules/livro/livro_controller.dart';
import 'package:app_biblioteca/backend/modules/livro/livro.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  LivroController livroController = LivroController();
  Future<List<Livro>> listaLivros = LivroController().listar();
/*
  List<CardLivro> paraVoce = [
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/511+-lOOtsL._SY344_BO1,204,203,200_.jpg',
        titulo: 'O Hobbit',
        valor: '30,00'),
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/41s5nOT9DqL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'O Manifesto Comunista',
        valor: '10,00'),
    CardLivro(
        imagem: 'https://m.media-amazon.com/images/I/511VQoE7CXL._SY346_.jpg',
        titulo: 'Orgulho e Preconceito',
        valor: '30,00'),
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/51olydUbI6L._SX346_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 1',
        valor: '50,00'),
  ];

  List<Livro> talvezGoste = [
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/51EZZWkTECL._SX331_BO1,204,203,200_.jpg',
        titulo: 'O Silmarillon',
        valor: '40,00'),
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/41afCn3PQUL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'O Pequeno Princípe',
        valor: '20,00'),
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/516VOgxwg2L._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'A garota do lago',
        valor: '15,00'),
  ];

  List<Livro> recentes = [
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/51xJXGttg8L._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'Evangélion',
        valor: '10,00'),
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/51rgk+G0qKL._SY344_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 2',
        valor: '40,00'),
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/41897yAI4LL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'Harry Potter e a Pedra Filosofal',
        valor: '30,00'),
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/51olydUbI6L._SX346_BO1,204,203,200_.jpg',
        titulo: 'One Piece',
        valor: '50,00'),
  ];

  List<Livro> acao = [
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/51rgk+G0qKL._SY344_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 2',
        valor: '40,00')
  ];*/
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
          drawer: DrawerWidget(),
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Para você',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildLista(listaLivros: listaLivros),
                  const SizedBox(height: 30),
                  const Text(
                    'Talvez você goste',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildLista(listaLivros: listaLivros),
                  const SizedBox(height: 30),
                  const Text(
                    'Baseado em pesquisas recentes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildLista(listaLivros: listaLivros)
                ]),
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
    title: Text('Início', style: TextStyle(fontSize: 15)),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: 16,
          ),
        );
      },
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          size: 16,
        ),
        onPressed: () {},
      )
    ],
  );
}

buildLista({required Future<List<Livro>> listaLivros}) {
  return Container(
    height: 160,
    child: FutureBuilder(
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
    ),
  );
}

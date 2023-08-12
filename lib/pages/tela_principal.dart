import 'package:app_biblioteca/pages/tela_usuario.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/widgets/card_livro.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Livro> paraVoce = [
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/511+-lOOtsL._SY344_BO1,204,203,200_.jpg',
        titulo: 'O Hobbit',
        valor: '30,00'),
    Livro(
        imagem:
            'https://m.media-amazon.com/images/I/41s5nOT9DqL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'O Manifesto Comunista',
        valor: '10,00'),
    Livro(
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
  ];
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
                  buildLista(listLenght: paraVoce.length, livro: paraVoce),
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
                  buildLista(
                      listLenght: talvezGoste.length, livro: talvezGoste),
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
                  buildLista(listLenght: recentes.length, livro: recentes)
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
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        size: 16,
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.perm_identity,
          size: 16,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TelaUsuario()),
          );
        },
      )
    ],
  );
}

buildLista({required int listLenght, required List<Livro> livro}) {
  return Container(
    height: 160,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: listLenght,
      separatorBuilder: (context, _) => const SizedBox(width: 12),
      itemBuilder: (context, index) => livro[index],
    ),
  );
}

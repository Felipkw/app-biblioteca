import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class CardLivro {
  final String imagem;
  final String titulo;
  final String valor;

  const CardLivro({
    required this.imagem,
    required this.titulo,
    required this.valor,
  });
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/51olydUbI6L._SX346_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 1',
        valor: '50,00'),
  ];

  List<CardLivro> talvezGoste = [
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/51EZZWkTECL._SX331_BO1,204,203,200_.jpg',
        titulo: 'O Silmarillon',
        valor: '40,00'),
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/41afCn3PQUL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'O Pequeno Princípe',
        valor: '20,00'),
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/516VOgxwg2L._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'A garota do lago',
        valor: '15,00'),
  ];

  List<CardLivro> recentes = [
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/51xJXGttg8L._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'Evangélion',
        valor: '10,00'),
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/51rgk+G0qKL._SY344_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 2',
        valor: '40,00'),
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/41897yAI4LL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'Harry Potter e a Pedra Filosofal',
        valor: '30,00'),
    CardLivro(
        imagem:
            'https://m.media-amazon.com/images/I/51olydUbI6L._SX346_BO1,204,203,200_.jpg',
        titulo: 'One Piece',
        valor: '50,00'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Para você',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: paraVoce.length,
                      separatorBuilder: (context, _) => SizedBox(width: 12),
                      itemBuilder: (context, index) =>
                          buildCard(cardLivro: paraVoce[index]),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Talvez você goste',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: talvezGoste.length,
                      separatorBuilder: (context, _) => SizedBox(width: 12),
                      itemBuilder: (context, index) =>
                          buildCard(cardLivro: talvezGoste[index]),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Baseado em pesquisas recentes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: talvezGoste.length,
                      separatorBuilder: (context, _) => SizedBox(width: 12),
                      itemBuilder: (context, index) =>
                          buildCard(cardLivro: recentes[index]),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

buildAppBar() {
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
        onPressed: () {},
      )
    ],
  );
}

buildCard({required CardLivro cardLivro}) => Container(
      width: 130,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              cardLivro.imagem,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            cardLivro.titulo,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          Text(
            "R\$ " + cardLivro.valor,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

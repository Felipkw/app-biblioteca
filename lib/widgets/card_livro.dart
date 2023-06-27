import 'package:flutter/material.dart';

class Livro extends StatefulWidget {

  final String imagem;
  final String titulo;
  final String valor;

  const Livro({
    required this.imagem,
    required this.titulo,
    required this.valor,
    Key? key,
  }) : super(key: key);

  @override
  State<Livro> createState() => _LivroState();
}

class _LivroState extends State<Livro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.imagem,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.titulo,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          Text(
            "R\$ " + widget.valor,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
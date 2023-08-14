import 'package:flutter/material.dart';
import 'package:app_biblioteca/backend/modules/livro/livro.dart';

class CardLivro extends StatefulWidget {

  final Livro livro;

  const CardLivro({
    required this.livro,
    Key? key,
  }) : super(key: key);

  @override
  State<CardLivro> createState() => _CardLivroState();
}

class _CardLivroState extends State<CardLivro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.livro.urlImagem,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.livro.titulo,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          Text(
            "R\$  ${widget.livro.valor}",
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
import 'package:app_biblioteca/pages/tela_detalhes.dart';
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
    return InkWell(
      onTap: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
                child: CircularProgressIndicator(),
              );
            
          },
        );
        new Future.delayed(new Duration(seconds: 1), () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TelaDetalhes(
                cardLivro: widget.livro,
              );
            }),
          );
        });
      },
      child: Container(
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
              "R\$  ${widget.livro.preco}",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/pages/tela_detalhes.dart';
import 'package:flutter/material.dart';

class CardLivroUsuario extends StatefulWidget {
  
  final Livro livro;

  const CardLivroUsuario({required this.livro, Key? key}) : super(key: key);

  @override
  _CardLivroUsuarioState createState() => _CardLivroUsuarioState();
}

class _CardLivroUsuarioState extends State<CardLivroUsuario> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(
                child: CircularProgressIndicator(),
              );
            
          },
        );
        Future.delayed(new Duration(seconds: 1), () {
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
        //height: 200,
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
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
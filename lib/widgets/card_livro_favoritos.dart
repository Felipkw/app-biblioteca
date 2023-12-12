import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/pages/tela_detalhe_favoritos.dart';
import 'package:app_biblioteca/pages/tela_detalhes.dart';
import 'package:flutter/material.dart';

class CardLivroFavoritos extends StatefulWidget {
  final Livro livro;

  const CardLivroFavoritos({
    required this.livro,
    Key? key,
  }) : super(key: key);

  @override
  State<CardLivroFavoritos> createState() => _CardLivroFavoritosState();
}

class _CardLivroFavoritosState extends State<CardLivroFavoritos> {
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
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return TelaDetalhesFavoritos(
                cardLivro: widget.livro,
              );
            }),
          );
        });
      },
      child: SizedBox(
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

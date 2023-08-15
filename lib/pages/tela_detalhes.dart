import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/pages/tela_cadastro.dart';
import 'package:app_biblioteca/pages/tela_login.dart';
import 'package:app_biblioteca/pages/tela_principal.dart';
import 'package:app_biblioteca/widgets/card_livro.dart';
import 'package:flutter/material.dart';

class TelaDetalhes extends StatefulWidget {
  final Livro cardLivro;

  const TelaDetalhes({
    Key? key,
    required this.cardLivro,
  }) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  Livro get livro => widget.cardLivro;

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
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20.0),
                    Row(children: [
                      Flexible(
                        child: SizedBox(
                          width: 150,
                          child: Image.network(
                            widget.cardLivro.urlImagem,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 200,
                          width: 1000,
                          child: Column(children: [
                            Text(
                              widget.cardLivro.titulo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Flexible(
                              child: Text(
                                "R\$ ${widget.cardLivro.valor}0",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Flexible(
                              child: SizedBox(
                                  height: 100,
                                  width: 1000,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 40,
                                    color: Colors.white,
                                  )),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: 500,
                            child: Text(
                              'Descrição:\nBilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(fontSize: 16.0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const TelaCadastro()),
                          );
                        },
                        child: const Text("Comprar")),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10.0),
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(fontSize: 16.0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.of(context).push(
                          // MaterialPageRoute(
                          //builder: (context) => const Livroo()),
                          // );
                        },
                        child: const Text("Carrinho")),
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

buildAppBar() {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text('Início', style: TextStyle(fontSize: 15)),
    actions: [
      IconButton(
        icon: Icon(
          Icons.menu,
          size: 16,
        ),
        onPressed: () {},
      ),
    ],
  );
}

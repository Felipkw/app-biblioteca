import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:app_biblioteca/pages/tela_usuario.dart';
import 'package:app_biblioteca/widgets/card_livro.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/bloc/favoritos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/drawer_widget.dart';

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({super.key});

  @override
  State<TelaFavoritos> createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
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
          drawer: const DrawerWidget(),
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Favoritos',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 400,
                    width: 150,
                    child: BlocBuilder<FavoritosCubit, List<Livro>>(
                      builder: (context, state) {
                        var list = state;

                        if (list.isNotEmpty) {
                          return Row( 
                            children: [ GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return CardLivro(
                                livro: list[index],
                              );
                            },
                          ),
                            ],
                          );
                        }

                        return const Center(
                          child: Text(
                            'Você não possui favoritos!',
                            style: TextStyle(fontSize: 24),
                          ),
                        );
                      },
                    ),
                  ),
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

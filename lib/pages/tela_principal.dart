import 'package:app_biblioteca/backend/modules/livro/repository/livro_sqlite_repository.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/widgets/card_livro.dart';
import 'package:app_biblioteca/widgets/drawer_widget.dart';
import 'package:app_biblioteca/backend/modules/livro/livro.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Future<List<Livro>> listaLivros = LivroSqliteRepository().listar();
  Future<List<Livro>> listaTalvezGoste =
      LivroSqliteRepository().listarTalvezGoste();
  Future<List<Livro>> listaParaVoce = LivroSqliteRepository().listarParaVoce();

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
                  buildLista(listaLivros: listaTalvezGoste),
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
                  buildLista(listaLivros: listaParaVoce)
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
    title: const Text('Início', style: TextStyle(fontSize: 15)),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 16,
          ),
        );
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          size: 16,
        ),
        onPressed: () {},
      )
    ],
  );
}

buildLista({required Future<List<Livro>> listaLivros}) {
  return SizedBox(
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

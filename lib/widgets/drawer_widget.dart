import 'package:app_biblioteca/backend/database/shared_prefs.dart';
import 'package:app_biblioteca/pages/tela_inicial.dart';
import 'package:app_biblioteca/pages/tela_livros_usuario.dart';
import 'package:app_biblioteca/pages/tela_usuario.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff6A1B9A), Colors.black],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildHeader(context),
                const Divider(
                  color: Colors.white,
                ),
                buildMenuItens(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top, bottom: 12),
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
            IconButton(
              iconSize: 100,
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const TelaUsuario()),
                );
              },
              icon: const CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://c.wallhere.com/photos/a0/bd/Chainsaw_Man_Aki_Chainsaw_Man_Aki_Hayakawa_anime_Anime_screenshot-2202139.jpg!d'),
              ),
            ),
            const Text('Usuário',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 6),
            const Text('usuário@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItens(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 25,
          leading: const Icon(Icons.home, color: Colors.white, size: 20),
          title:
              const Text('Home', style: TextStyle(fontSize: 16, color: Colors.white)),
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ListTile(
          minLeadingWidth: 25,
          leading: const Icon(Icons.favorite_border, color: Colors.white, size: 20),
          title: const Text('Favoritos',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          onTap: () {},
        ),
        const SizedBox(height: 8),
        ListTile(
          minLeadingWidth: 25,
          leading: const Icon(Icons.book, color: Colors.white, size: 20),
          title: const Text('Meus Livros',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const TelaLivrosUsuario()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          minLeadingWidth: 25,
          leading: const Icon(Icons.exit_to_app, color: Colors.white, size: 20),
          title: const Text('Logout',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          onTap: () {
            // remove as infomações do usuário do shared preferences
            SharedPrefs().setUser(false);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const TelaInicial()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }
}

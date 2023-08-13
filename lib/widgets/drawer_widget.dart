import 'package:app_biblioteca/pages/tela_inicial.dart';
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
    return Container(
      width: 275,
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
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
                Divider(
                  color: Colors.white,
                ),
                BuildMenuItens(context),
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
                  MaterialPageRoute(builder: (context) => TelaUsuario()),
                );
              },
              icon: CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://c.wallhere.com/photos/a0/bd/Chainsaw_Man_Aki_Chainsaw_Man_Aki_Hayakawa_anime_Anime_screenshot-2202139.jpg!d'),
              ),
            ),
            Text('Usuário',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            SizedBox(height: 6),
            Text('usuário@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget BuildMenuItens(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 25,
          leading: Icon(Icons.home, color: Colors.white, size: 20),
          title:
              Text('Home', style: TextStyle(fontSize: 16, color: Colors.white)),
          onTap: () {},
        ),
        SizedBox(height: 8),
        ListTile(
          minLeadingWidth: 25,
          leading: Icon(Icons.favorite_border, color: Colors.white, size: 20),
          title: Text('Favoritos',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          onTap: () {},
        ),
        SizedBox(height: 8),
        ListTile(
          minLeadingWidth: 25,
          leading: Icon(Icons.book, color: Colors.white, size: 20),
          title: Text('Meus Livros',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          onTap: () {},
        ),
        SizedBox(height: 8),
        ListTile(
          minLeadingWidth: 25,
          leading: Icon(Icons.exit_to_app, color: Colors.white, size: 20),
          title: Text('Logout',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          onTap: () {
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

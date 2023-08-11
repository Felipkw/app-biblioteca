import 'package:flutter/material.dart';

class TelaUsuario extends StatefulWidget {
  const TelaUsuario({super.key});

  @override
  State<TelaUsuario> createState() => _TelaUsuarioState();
}

class _TelaUsuarioState extends State<TelaUsuario> {
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
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(
                        'https://64.media.tumblr.com/4dcfac158beb80938140ff6965eb56e1/681395bdf23060e5-d0/s1280x1920/65a85181b7fd6ae0c8097323f11bcd3fd875a705.jpg'),
                  ),
                  
                  SizedBox(height: 20),

                  Text('Nome de usuário',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ), 
                  ),

                  
                ],
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
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text('Usuário', style: TextStyle(fontSize: 15)),
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        size: 16,
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 16,
        ),
        onPressed: () {},
      )
    ],
  );
}

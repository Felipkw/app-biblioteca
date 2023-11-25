import 'package:app_biblioteca/backend/database/shared_prefs.dart';
import 'package:app_biblioteca/pages/tela_inicial.dart';
import 'package:app_biblioteca/pages/tela_principal.dart';
import 'package:flutter/material.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  checkUserStatus() async {
    bool isLogged = await SharedPrefs().getUser();
    await Future.delayed(const Duration(seconds: 5));

    if (isLogged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const TelaPrincipal();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const TelaInicial();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*backgroundColor: const Color(0xFF10397B),
      body: Center(
        child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/9/99/Logo-hurb-branca-bg-azul.jpg'),
      ),*/

      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Login", style: TextStyle(fontSize: 15)),
      ),
    );
  }
}

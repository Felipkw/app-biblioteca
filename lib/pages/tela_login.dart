import 'package:app_biblioteca/pages/tela_cadastro.dart';
import 'package:app_biblioteca/pages/tela_principal.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 96.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 16.0),
                Flexible(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Digite seu e-mail',
                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Flexible(
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 16.0),
                Flexible(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromWidth(150)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurple),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(fontSize: 16.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        _emailController.clear();
                        _passwordController.clear();

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => TelaPrincipal()),
                        );
                      },
                      child: const Text("Login")),
                ),
                const SizedBox(height: 16.0),
                Flexible(
                  child: const Text(
                    "Ainda não possui uma conta? Faça o cadastro",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                Flexible(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromWidth(150)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurple),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const TelaCadastro()),
                        );
                      },
                      child: const Text("Cadastro")),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("Login", style: TextStyle(fontSize: 15)),
    );
  }
}

import 'package:app_biblioteca/tela_login.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nameController = TextEditingController();
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Digite como deseja ser chamado',
                        labelText: 'Nome',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(fontSize: 14.0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          String name = _nameController.text;
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          print('Nome: $name');
                          print('Email: $email');
                          print('Senha: $password');

                          _nameController.clear();
                          _emailController.clear();
                          _passwordController.clear();
                        },
                        child: const Text(
                          "Cadastre-se",
                          style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                  ),
                  const SizedBox(height: 16.0),
                  const Flexible(
                    child: Text(
                      "Já possui uma conta? Faça o Login",
                      style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Flexible(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            const TextStyle(fontSize: 14.0),
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
                                builder: (context) => const TelaLogin()),
                          );
                        },
                        child: const Text("Login")),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("Cadastrar", style: TextStyle(fontSize: 15)),
    );
  }
}

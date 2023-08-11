import 'package:app_biblioteca/backend/modules/usuario/usuario.dart';
import 'package:app_biblioteca/backend/modules/usuario/usuario_controller.dart';
import 'package:app_biblioteca/pages/tela_login.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidEmail(String email) {
    // Expressão Regular para validar o email
    // O padrão verifica se o email possui um formato válido
    // (uma sequência de caracteres seguida de um @, seguida de outra sequência de caracteres, seguida de um ponto e um domínio)
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }

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
              child: Form(
                key: _formKey,
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
                      child: TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                          hintText: 'Digite como deseja ser chamado',
                          labelText: 'Nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'O nome é obrigatório';
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Flexible(
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Digite seu e-mail',
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "o e-mail é obrigatório";
                          } else if (!_isValidEmail(value)) {
                            return 'O e-mail precisa ser válido';
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Flexible(
                      child: TextFormField(
                        controller: _senhaController,
                        decoration: InputDecoration(
                          hintText: 'Digite sua senha',
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          filled: true,
                          fillColor: Colors.white,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'A senha é obrigatório';
                          } else if (value.length < 8) {
                            return 'A senha deve ter, no mínimo, 8 caracteres';
                          }
                        },
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String nome = _nomeController.text;
                              String email = _emailController.text;
                              String senha = _senhaController.text;

                              Usuario usuario = Usuario(
                                  nome: nome, email: email, senha: senha);

                              print(usuario.nome);
                              print(usuario.email);
                              print(usuario.senha);

                              UsuarioController usuarioController = UsuarioController();
                              usuarioController.criar(usuario: usuario);

                              _nomeController.clear();
                              _emailController.clear();
                              _senhaController.clear();

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => TelaLogin()),
                              );
                            }
                          },
                          child: const Text(
                            "Cadastre-se",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(height: 16.0),
                    const Flexible(
                      child: Text(
                        "Já possui uma conta? Faça o Login",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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

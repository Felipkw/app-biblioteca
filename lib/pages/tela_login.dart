import 'package:app_biblioteca/backend/modules/usuario/usuario_controller.dart';
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
  final TextEditingController _senhaController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }

  bool _isObscure = true;

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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 34),
                  const Icon(
                    Icons.account_circle,
                    size: 96.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 38),
                  TextFormField(
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
                      return null;
                    },
                  ),
                  const SizedBox(height: 38),
                  TextFormField(
                    controller: _senhaController,
                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      filled: true,
                      fillColor: Colors.white,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                    ),
                    obscureText: _isObscure,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'A senha é obrigatório';
                      } else if (value.length < 8) {
                        return 'A senha deve ter, no mínimo, 8 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size.fromWidth(150)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurple),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 24.0),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          String senha = _senhaController.text;

                          _emailController.clear();
                          _senhaController.clear();

                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );

                          bool autenticado = false;

                          UsuarioController usuarioController =
                              UsuarioController();

                          autenticado = await usuarioController.autenticar(
                              email: email, senha: senha);

                          Navigator.of(context).pop();

                          if (autenticado) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const TelaPrincipal()),
                            );
                          } else {
                            _autenticadoFalse();
                          }
                        }
                      },
                      child: const Text("Login")),
                  const SizedBox(height: 20.0),
                  Text(
                    "Ainda não possui uma conta?",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  Text(
                    "Faça o cadastro",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size.fromWidth(150)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurple),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 24.0),
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
                ],
              ),
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

  _autenticadoFalse() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Erro no login!",
                style: TextStyle(color: Colors.red),
              ),
              content: const Text("Seu email e senha não correspondem"),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }
}

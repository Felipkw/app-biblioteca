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
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 22),
                      const Icon(
                        Icons.account_circle,
                        size: 96.0,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
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
                          return null;
                        },
                      ),
                      const SizedBox(height: 25.0),
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
                      const SizedBox(height: 25.0),
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
                            return 'A senha deve ter no mínimo 8 caracteres';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 24.0),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String nome = _nomeController.text;
                              String email = _emailController.text;
                              String senha = _senhaController.text;
                              Usuario usuario = Usuario.cadastro(
                                  nome: nome, email: email, senha: senha);

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );

                              UsuarioController usuarioController =
                                  UsuarioController();

                              bool emailExiste = await usuarioController
                                  .emailExiste(email: usuario.email);

                              if (emailExiste) {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();

                                _emailExistente();
                              } else {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();

                                await usuarioController.criar(usuario: usuario);

                                _nomeController.clear();
                                _emailController.clear();
                                _senhaController.clear();

                                _cadastroSucesso();
                              }
                            }
                          },
                          child: const Text(
                            "Cadastre-se",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(height: 18.0),
                      Text(
                        "Já possui uma conta? Faça o Login",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Faça o Login",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 18.0),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 24.0),
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
                    ],
                  ),
                ),
              )),
        ),
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

  _cadastroSucesso() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Registrado com sucesso!",
                style: TextStyle(color: Colors.blueAccent),
              ),
              content: const Text("Fique a vontade para realizar o login"),
              actions: [
                ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TelaLogin()));
                    }),
              ],
            ));
  }

  _emailExistente() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Endereço de e-mail já cadastrado!",
            style: TextStyle(color: Colors.red)),
        content: const Text(
            "Por favor, faça login ou use um e-mail diferente para se cadastrar"),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

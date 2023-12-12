import 'package:app_biblioteca/backend/database/address_api.dart';
import 'package:app_biblioteca/backend/modules/address/address.dart';
import 'package:app_biblioteca/pages/tela_cadastro.dart';
import 'package:app_biblioteca/pages/tela_login.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
            child: Container(
              color: Colors.transparent,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 96.0,
                  color: Colors.white,
                ),
                
                const SizedBox(height: 20.0),

                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(fontSize: 16.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const TelaCadastro()),
                        );
                    },
                    child: const Text("Cadastro")
                ),

                const SizedBox(height: 20.0),

                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(fontSize: 16.0),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const TelaLogin()),
                          );
                    },
                    child: const Text("Login")
                ),
                                        Column(
            children: [
              Text(
                'Endereço:',
                style: TextStyle(fontSize: 16.0,color: Colors.white),
              ),
              FutureBuilder(
                future: pegarCep(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 16.0,color: Colors.white),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          )
              ],
            ),
            ),
          ),
          ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
    Future<String> pegarCep() async {
    String texto = '';
    await Future.delayed(const Duration(seconds: 3));
    Address? address = await AddressApi().findAddressByCep("57318450");
    if (address != null) {
      texto = '${address.city}';
    } else {
      texto = 'Error!!';
    }
    return texto;
}
}
import 'dart:io';
import 'package:app_biblioteca/widgets/image_default_widget.dart';
import 'package:app_biblioteca/widgets/image_widget.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_biblioteca/pages/tela_principal.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TelaUsuario extends StatefulWidget {
  const TelaUsuario({super.key});

  @override
  State<TelaUsuario> createState() => _TelaUsuarioState();
}

class _TelaUsuarioState extends State<TelaUsuario> {
  File? image;
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
          appBar: buildAppBar(context),
          body: SingleChildScrollView(
            child: Center(
              child: Flexible(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    
                  image != null
                        ? ImageWidget(image: image!, onClicked: (source) => pickImage(source))
                        : ImageDefaultWidget(onClicked: (source) => pickImage(source)),
                  
                    SizedBox(height: 10),
                    Text(
                      'Nome de usuário',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurple),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromWidth(210)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(fontSize: 16.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.account_circle),
                      label: const Text("Informações",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                      onPressed: () {},
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.deepPurple),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromWidth(210)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(fontSize: 16.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      label: Text("Carrinho",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size.fromWidth(210)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(fontSize: 16.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      label: Text("Excluir perfil",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final userImage = await saveImagePermanently(image.path);
      setState(() => this.image = userImage);
    } on PlatformException catch (e) {
      print('Fail in pick image $e');
    }
  }
}

Future<File> saveImagePermanently(String imagePath) async {
  final directory = await getApplicationDocumentsDirectory();
  final name = basename(imagePath);
  final image = File('${directory.path}/$name');

  return File(imagePath).copy(image.path);
}

buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text('Usuário', style: TextStyle(fontSize: 15)),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 16,
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TelaPrincipal()));
      },
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.menu,
          size: 16,
        ),
        onPressed: () {},
      ),
    ],
  );
}

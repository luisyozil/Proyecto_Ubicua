import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Imagenes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.android),
      ),
      body: ListView(
        children: <Widget>[
          Captura(
            guardaImagen: (File file) {
              Upload.Subir(file);
            },
          ),
        ],
      ),
    );
  }
}

class Captura extends StatefulWidget {
  final Function guardaImagen;
  Captura({this.guardaImagen});

  _CapturaState createState() => _CapturaState();
}

class _CapturaState extends State<Captura> {
  File imagen;

  Future<void> pickImage() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagen = selected;
      widget.guardaImagen(imagen);
    });
  }

  @override
  void initState() {
    imagen = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        (imagen == null ? Text("Selecciona una imagen") : Text("tengo una imagen")),
        IconButton(
          icon: Icon(Icons.image),
          onPressed: () {
            pickImage();
          },
        ),
        Expanded(
          child: FutureBuilder(
            future: Upload().getImage('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
            builder: (context, snapshot){
              return Container(
                child: snapshot.data,
              );
            },
          ),
        ),
      ],
    );
  }
}

class Upload
{
  final FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://proyectoubicua-8b009.appspot.com');

  Upload.Subir(File file){
    String nombre = '${DateTime.now()}.png';
    storage.ref().child(nombre).putFile(file);
  }

  Upload();

  Future<Widget> getImage(String nombre) async{
    String url = await storage.ref().getDownloadURL();

  }
}
import 'package:flutter/material.dart';
import 'db.dart' as db;
import 'modelos/Usuario.dart';

class Prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: StreamBuilder(
            stream: db.dameUsuarios(),
            builder: (context, AsyncSnapshot<List<Usuario>> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (!snapshot.hasData) {
                return Text(
                  "No hay datos",
                  style: TextStyle(color: Colors.white),
                );
              }
              List<Usuario> usuarios = snapshot.data;
              return ListView.builder(
                  itemCount: usuarios.length,
                  itemBuilder: (context, index) {
                    return Text(usuarios[index].nombre);
                  });
            }));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ubicua/Tulio.dart';
import 'db.dart' as db;
import 'modelos/Usuario.dart';

class Prueba extends StatelessWidget {
  Prueba(this.usuario);
  final FirebaseUser usuario;
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Renglon(
                    usuarios: snapshot.data,
                  ),
                ),
                MessageBox(onSend: (text) {
                  db.GuardaUsuario(Usuario(text));
                }),
                Datos(usuario),
              ],
            );
          }),
    );
  }
}

class Datos extends StatelessWidget {
  Datos(this.usuario);
  final FirebaseUser usuario;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection("usuarios").document(usuario.uid).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          return Column(
            children: <Widget>[
              Text(snapshot.data['nombre']),
              Image.network(snapshot.data["imagen"]),
            ],
          );
        },
      ),
    );
  }
}

//clase para escribir cada nombre
class Renglon extends StatelessWidget {
  const Renglon({this.usuarios});
  final List<Usuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(usuarios[index].nombre),
              Text(usuarios[index].correo),
            ],
          ),
        );
      },
    );
  }
}

class MessageBox extends StatefulWidget {
  final Function onSend;
  MessageBox({this.onSend});

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _send(String text) {
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _controller,
            //onSubmitted: _send,
          ),
        ),
        IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _send(_controller.text);
            })
      ],
    );
  }
}

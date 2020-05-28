import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'db.dart' as db;
import 'package:path/path.dart';
import 'modelos/Usuario.dart';

class MyProfile extends StatefulWidget {
  final FirebaseUser usuario;
  MyProfile(this.usuario);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MyProfile> {
  File _image;
  Usuario user;
  TextEditingController _name;
  TextEditingController _lastname;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _lastname.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _name = TextEditingController();
    _lastname = TextEditingController();
    super.initState();
  }

  Future <void> uploadPic() async{
    final formstate = _formkey.currentState;
    if (formstate.validate()) {
      formstate.save();
      String url = user.imagen;
      if (_image != null) {
          String fileName = basename(_image.path);
          StorageReference firebaseStorageRef = FirebaseStorage.instance.ref()
              .child(fileName);
          StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
          StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
          url = await firebaseStorageRef.getDownloadURL();
          user.imagen = url.toString();
        }
        user.nombre = _name.text;
        user.apellido = _lastname.text;
        db.ActualizaUsuario(widget.usuario.uid, user);
    }
  }

  @override
  Widget build(BuildContext context) {
    String Url;
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    return StreamBuilder(
        stream: db.BuscaUsuario(widget.usuario.uid),
        builder: (context, AsyncSnapshot<Usuario> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          user = snapshot.data;
          _name.text = user.nombre;
          _lastname.text = user.apellido;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text('Perfil'),
            ),
            body: Builder(
              builder: (context) =>  Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Theme.of(context).accentColor,
                              child: ClipOval(
                                child: new SizedBox(
                                  width: 180.0,
                                  height: 180.0,
                                  child: (_image!=null)?Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ):Image.network(
                                    user.imagen,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 60.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Theme.of(context).accentColor,
                                size: 30.0,
                              ),
                              onPressed: () {
                                getImage();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) return "No puede estar vacio";
                                },
                                onSaved: (input) => _name.text = input,
                                controller: _name,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.person),
                                  hintText: "Nombre",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: TextFormField(
                                validator: (input) {
                                  if (input.isEmpty) return "No puede estar vacio";
                                },
                                onSaved: (input) => _lastname.text = input,
                                controller: _lastname,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.person),
                                  hintText: "Apellido",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Email',
                                style:
                                TextStyle(color: Colors.blueGrey, fontSize: 18.0)),
                            SizedBox(width: 20.0),
                            Text(user.correo,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            color: Theme.of(context).accentColor,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            elevation: 4.0,
                            child: Text(
                              'Cancelar',
                            ),
                          ),
                          RaisedButton(
                            color: Theme.of(context).accentColor,
                            onPressed: () {
                              uploadPic().whenComplete(() {
                                Navigator.of(context).pop();
                              });
                            },
                            elevation: 4.0,
                            child: Text(
                              'Aceptar',
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                )
              ),
            ),
          );
        }
    );
  }
}